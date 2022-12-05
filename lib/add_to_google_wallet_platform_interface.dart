import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'add_to_google_wallet_method_channel.dart';

abstract class AddToGoogleWalletPlatform extends PlatformInterface {
  /// Constructs a AddToGoogleWalletPlatform.
  AddToGoogleWalletPlatform() : super(token: _token);

  static final Object _token = Object();

  static AddToGoogleWalletPlatform _instance = MethodChannelAddToGoogleWallet();

  /// The default instance of [AddToGoogleWalletPlatform] to use.
  ///
  /// Defaults to [MethodChannelAddToGoogleWallet].
  static AddToGoogleWalletPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AddToGoogleWalletPlatform] when
  /// they register themselves.
  static set instance(AddToGoogleWalletPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
