import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  /// The catalog is laid out for a portrait phone and there is no desktop
  /// design, so the window is held in comparable proportions instead.
  private static let minimumContentSize = NSSize(width: 400, height: 700)
  private static let initialContentSize = NSSize(width: 480, height: 860)

  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    self.contentViewController = flutterViewController
    self.contentMinSize = MainFlutterWindow.minimumContentSize
    self.setContentSize(MainFlutterWindow.initialContentSize)
    self.center()

    RegisterGeneratedPlugins(registry: flutterViewController)

    super.awakeFromNib()
  }
}
