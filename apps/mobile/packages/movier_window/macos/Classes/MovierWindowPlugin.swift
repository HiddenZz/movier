import Cocoa
import FlutterMacOS

/// Reports the player window's actual fullscreen state to Dart, including
/// transitions the system starts (green button, Mission Control, Ctrl+Cmd+F,
/// Esc) — those never go through `setFullscreen`.
public class MovierWindowPlugin: NSObject, FlutterPlugin, WindowFullscreenHostApi {
  private weak var window: NSWindow?
  private let flutterApi: WindowFullscreenFlutterApi

  /// How long a transition is assumed to run after `willEnter`/`willExit`.
  /// The animation itself takes well under a second.
  private static let transitionTimeout: TimeInterval = 2

  /// When the current transition started, from a monotonic clock, or `nil`
  /// once it finished. Tracked from `willEnter`/`willExit` because
  /// `toggleFullScreen` itself reports nothing back.
  private var transitionStartedAt: TimeInterval?

  /// macOS ignores `toggleFullScreen` while an animation is already running.
  ///
  /// Expires on its own: a cancelled transition reports no `didEnter`/`didExit`
  /// (AppKit tells that only to the window delegate, which this plugin is not),
  /// so a plain flag would stay raised and block fullscreen for good.
  private var isTransitioning: Bool {
    guard let transitionStartedAt else { return false }
    return ProcessInfo.processInfo.systemUptime - transitionStartedAt < Self.transitionTimeout
  }

  init(window: NSWindow?, flutterApi: WindowFullscreenFlutterApi) {
    self.window = window
    self.flutterApi = flutterApi
    super.init()
    observe(window)
  }

  deinit {
    NotificationCenter.default.removeObserver(self)
  }

  public static func register(with registrar: FlutterPluginRegistrar) {
    let flutterApi = WindowFullscreenFlutterApi(binaryMessenger: registrar.messenger)
    let instance = MovierWindowPlugin(window: registrar.view?.window, flutterApi: flutterApi)
    WindowFullscreenHostApiSetup.setUp(binaryMessenger: registrar.messenger, api: instance)
  }

  private func observe(_ window: NSWindow?) {
    guard let window else { return }
    let center = NotificationCenter.default
    center.addObserver(self, selector: #selector(willTransition), name: NSWindow.willEnterFullScreenNotification, object: window)
    center.addObserver(self, selector: #selector(willTransition), name: NSWindow.willExitFullScreenNotification, object: window)
    center.addObserver(self, selector: #selector(didEnter), name: NSWindow.didEnterFullScreenNotification, object: window)
    center.addObserver(self, selector: #selector(didExit), name: NSWindow.didExitFullScreenNotification, object: window)
  }

  @objc private func willTransition(_ notification: Notification) {
    transitionStartedAt = ProcessInfo.processInfo.systemUptime
  }

  @objc private func didEnter(_ notification: Notification) {
    transitionStartedAt = nil
    flutterApi.onFullscreenChanged(fullscreen: true) { _ in }
  }

  @objc private func didExit(_ notification: Notification) {
    transitionStartedAt = nil
    flutterApi.onFullscreenChanged(fullscreen: false) { _ in }
  }

  // MARK: - WindowFullscreenHostApi

  func isFullscreen() throws -> Bool {
    window?.styleMask.contains(.fullScreen) ?? false
  }

  func setFullscreen(fullscreen: Bool) throws -> Bool {
    guard let window, !isTransitioning else { return false }
    guard window.styleMask.contains(.fullScreen) != fullscreen else { return false }

    window.toggleFullScreen(nil)
    return true
  }
}
