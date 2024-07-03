import 'package:add_to_google_wallet/add_to_google_wallet_platform_interface.dart';
import 'package:flutter/material.dart';

class AddToGoogleWallet {
  Future<void> saveLoyaltyPass({
    required String pass,
    Function(Object)? onError,
    VoidCallback? onSuccess,
    VoidCallback? onCanceled,
  }) =>
      AddToGoogleWalletPlatform.instance.saveLoyaltyPass(
        pass: pass,
        onError: onError,
        onSuccess: onSuccess,
        onCanceled: onCanceled,
      );

  Future<bool> get isGoogleWalletApiAvailable =>
      AddToGoogleWalletPlatform.instance.isGoogleWalletApiAvailable;
}
