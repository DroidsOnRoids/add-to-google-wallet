import 'package:add_to_google_wallet/add_to_google_wallet_platform_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class MethodChannelAddToGoogleWallet extends AddToGoogleWalletPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('com.droidsonroids/loyalty_pass');

  @override
  Future<void> saveLoyaltyPass(String pass) async {
    methodChannel.setMethodCallHandler((call) async {
      if (call.method == 'onError') {
        final message = call.arguments['message'];
        debugPrint("Error when trying to save Google Pay loyalty pass: $message");
      }
    });

    final Map<String, dynamic> sendMap = {'loyalty_pass': pass};

    await methodChannel.invokeMethod(
      'saveLoyaltyPass',
      Map.from(sendMap),
    );
  }
}
