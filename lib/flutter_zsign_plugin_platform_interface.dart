import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_zsign_plugin_method_channel.dart';

abstract class FlutterZsignPluginPlatform extends PlatformInterface {
  /// Constructs a FlutterZsignPluginPlatform.
  FlutterZsignPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterZsignPluginPlatform _instance = MethodChannelFlutterZsignPlugin();

  /// The default instance of [FlutterZsignPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterZsignPlugin].
  static FlutterZsignPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterZsignPluginPlatform] when
  /// they register themselves.
  static set instance(FlutterZsignPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
