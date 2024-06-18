import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_zsign_plugin_platform_interface.dart';

/// An implementation of [FlutterZsignPluginPlatform] that uses method channels.
class MethodChannelFlutterZsignPlugin extends FlutterZsignPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_zsign_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
