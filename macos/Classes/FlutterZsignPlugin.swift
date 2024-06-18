import Cocoa
import FlutterMacOS

public class FlutterZsignPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_zsign_plugin", binaryMessenger: registrar.messenger)
    let instance = FlutterZsignPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  func 建立虚拟函数表(){
      md5(nil); //让xcode链接去找md5函数，否则静态库会报错
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("macOS " + ProcessInfo.processInfo.operatingSystemVersionString)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
