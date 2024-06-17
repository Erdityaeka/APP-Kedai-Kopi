import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'whatsapp_message_plugin_method_channel.dart';

abstract class WhatsappMessagePluginPlatform extends PlatformInterface {
  /// Constructs a WhatsappMessagePluginPlatform.
  WhatsappMessagePluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static WhatsappMessagePluginPlatform _instance = MethodChannelWhatsappMessagePlugin();

  /// The default instance of [WhatsappMessagePluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelWhatsappMessagePlugin].
  static WhatsappMessagePluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [WhatsappMessagePluginPlatform] when
  /// they register themselves.
  static set instance(WhatsappMessagePluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
