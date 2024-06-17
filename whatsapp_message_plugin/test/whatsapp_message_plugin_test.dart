import 'package:flutter_test/flutter_test.dart';
import 'package:whatsapp_message_plugin/whatsapp_message_plugin.dart';
import 'package:whatsapp_message_plugin/whatsapp_message_plugin_platform_interface.dart';
import 'package:whatsapp_message_plugin/whatsapp_message_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockWhatsappMessagePluginPlatform
    with MockPlatformInterfaceMixin
    implements WhatsappMessagePluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final WhatsappMessagePluginPlatform initialPlatform = WhatsappMessagePluginPlatform.instance;

  test('$MethodChannelWhatsappMessagePlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelWhatsappMessagePlugin>());
  });

  test('getPlatformVersion', () async {
    WhatsappMessagePlugin whatsappMessagePlugin = WhatsappMessagePlugin();
    MockWhatsappMessagePluginPlatform fakePlatform = MockWhatsappMessagePluginPlatform();
    WhatsappMessagePluginPlatform.instance = fakePlatform;

    expect(await whatsappMessagePlugin.getPlatformVersion(), '42');
  });
}
