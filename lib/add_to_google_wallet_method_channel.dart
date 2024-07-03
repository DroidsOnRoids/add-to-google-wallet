import 'package:add_to_google_wallet/add_to_google_wallet_platform_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class MethodChannelAddToGoogleWallet extends AddToGoogleWalletPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('com.droidsonroids/loyalty_pass');

  @override
  Future<void> saveLoyaltyPass({
    required String pass,
    Function(Object)? onError,
    VoidCallback? onSuccess,
    VoidCallback? onCanceled,
  }) async {
    methodChannel.setMethodCallHandler((call) async {
      if (call.method == 'onError') {
        final message = call.arguments['message'];

        if (onError != null) {
          onError(message);
        }
      }

      if (call.method == 'onSuccess' && onSuccess != null) {
        onSuccess();
      }

      if (call.method == 'onCanceled' && onCanceled != null) {
        onCanceled();
      }
    });

    final Map<String, dynamic> sendMap = {'loyalty_pass': pass};

    await methodChannel.invokeMethod(
      'saveLoyaltyPass',
      Map.from(sendMap),
    );
  }

  @override
  Future<bool> get isGoogleWalletApiAvailable async {
    final bool result =
        await methodChannel.invokeMethod<bool>('isGoogleWalletApiAvailable') ??
            false;
    return result;
  }
}
