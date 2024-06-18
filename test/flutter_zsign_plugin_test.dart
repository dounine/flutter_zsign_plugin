import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_zsign_plugin/flutter_zsign_plugin.dart';
import 'package:flutter_zsign_plugin/flutter_zsign_plugin_platform_interface.dart';
import 'package:flutter_zsign_plugin/flutter_zsign_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterZsignPluginPlatform
    with MockPlatformInterfaceMixin
    implements FlutterZsignPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterZsignPluginPlatform initialPlatform = FlutterZsignPluginPlatform.instance;

  test('$MethodChannelFlutterZsignPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterZsignPlugin>());
  });

  test('getPlatformVersion', () async {
    FlutterZsignPlugin flutterZsignPlugin = FlutterZsignPlugin();
    MockFlutterZsignPluginPlatform fakePlatform = MockFlutterZsignPluginPlatform();
    FlutterZsignPluginPlatform.instance = fakePlatform;

    expect(await flutterZsignPlugin.getPlatformVersion(), '42');
  });
}
