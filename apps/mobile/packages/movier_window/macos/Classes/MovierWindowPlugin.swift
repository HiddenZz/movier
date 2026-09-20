import Cocoa
import FlutterMacOS

/// Reports the player window's actual fullscreen state to Dart, including
/// transitions the system starts (green button, Mission Control, Ctrl+Cmd+F,
/// Esc) — those never go through `setFullscreen`.
public class MovierWindowPlugin: NSObject, FlutterPlugin, WindowFullscreenHostApi {
  private weak var window: NSWindow?
  private let flutterApi: WindowFullscreenFlutterApi

  /// macOS ignores `toggleFullScreen` while an animation is already running.
  /// Tracked from `willEnter`/`willExit` because `toggleFullScreen` itself
  /// reports nothing back.
  private var isTransitioning = false

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
    isTransitioning = true
  }

  @objc private func didEnter(_ notification: Notification) {
    isTransitioning = false
    flutterApi.onFullscreenChanged(fullscreen: true) { _ in }
  }

  @objc private func didExit(_ notification: Notification) {
    isTransitioning = false
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
