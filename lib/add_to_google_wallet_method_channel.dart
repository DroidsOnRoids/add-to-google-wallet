import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'add_to_google_wallet_platform_interface.dart';

/// An implementation of [AddToGoogleWalletPlatform] that uses method channels.
class MethodChannelAddToGoogleWallet extends AddToGoogleWalletPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('add_to_google_wallet');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
