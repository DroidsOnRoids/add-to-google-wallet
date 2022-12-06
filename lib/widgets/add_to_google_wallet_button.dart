import 'package:add_to_google_wallet/add_to_google_wallet.dart';
import 'package:flutter/material.dart';

class AddToGoogleWalletButton extends StatelessWidget {
  final String pass;
  final Function(Object)? onError;
  final VoidCallback? onSuccess;
  final VoidCallback? onCanceled;

  const AddToGoogleWalletButton({
    super.key,
    this.onError,
    this.onSuccess,
    this.onCanceled,
    required this.pass,
  });

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: _onAddToGoogleWalletTap,
        //Official SVGs (https://developers.google.com/wallet/legacy-resources/button-guidelines) with multi-language support to be added
        child: const Text('Add to google wallet'),
      );

  void _onAddToGoogleWalletTap() => AddToGoogleWallet().saveLoyaltyPass(
        pass: pass,
        onError: onError,
        onSuccess: onSuccess,
        onCanceled: onCanceled,
      );
}
