import 'package:add_to_google_wallet/add_to_google_wallet.dart';
import 'package:add_to_google_wallet/button_language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const double _buttonRadius = 24.5;

class AddToGoogleWalletButton extends StatelessWidget {
  /// [Generic pass JSON Object](https://developers.google.com/wallet/generic/android#1_create_a_passes_object)
  /// [Google codelab example](https://codelabs.developers.google.com/add-to-wallet-android#5)
  final String pass;

  /// Language of the Add To Google Wallet button
  final ButtonLanguage language;

  /// Called when an error was thrown while adding a pass to the Google Wallet
  final Function(Object)? onError;

  /// Called when a pass was successfully added to the Google Wallet
  final VoidCallback? onSuccess;

  /// Called when a user canceled process of adding a pass to the Google Wallet
  final VoidCallback? onCanceled;

  const AddToGoogleWalletButton({
    super.key,
    this.onError,
    this.onSuccess,
    this.onCanceled,
    this.language = ButtonLanguage.en,
    required this.pass,
  });

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          SvgPicture.asset(language.path),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: _onAddToGoogleWalletTap,
                borderRadius: const BorderRadius.all(Radius.circular(_buttonRadius)),
              ),
            ),
          )
        ],
      );

  void _onAddToGoogleWalletTap() => AddToGoogleWallet().saveLoyaltyPass(
        pass: pass,
        onError: onError,
        onSuccess: onSuccess,
        onCanceled: onCanceled,
      );
}
