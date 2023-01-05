# Add To Google Wallet

A Flutter plugin that provides the [Add To Google Wallet Button](https://developers.google.com/wallet/retail/loyalty-cards/resources/brand-guidelines#add-to-google-wallet-button).

## Overview
The goal of this plugin is to simplify the implementation of Add To Google Wallet feature.

## Prerequisites
Before plugin can be used, make sure to complete all of the [prerequisites](https://developers.google.com/wallet/generic/android/prerequisites) listed below.

1. [Sign up for a Google Wallet API Issuer account](https://developers.google.com/wallet/generic/android/prerequisites#1.-sign-up-for-a-google-wallet-api-issuer-account)
2. [Authorize your app](https://developers.google.com/wallet/generic/android/prerequisites#3.-obtain-credentials-to-authorize-your-app)
3. [Create a Passes Class](https://developers.google.com/wallet/generic/android/prerequisites#5.-create-a-passes-class)
4. [Create a Passes Object](https://developers.google.com/wallet/generic/android#1_create_a_passes_object)

## Usage
To use this plugin, add `add_to_google_wallet` as a [dependency in your pubspec.yaml file](https://docs.flutter.dev/development/packages-and-plugins/using-packages).

```dart
import 'package:add_to_google_wallet/widgets/add_to_google_wallet_button.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: AddToGoogleWalletButton(
              pass: _examplePass,
              onSuccess: () {},
              onCanceled: () {},
              onError: (Object error) {},
              locale: const Locale.fromSubtags(
                languageCode: 'fr',
                countryCode: 'FR',
              ),
            ),
          ),
        ),
      ),
    );

const String _examplePass = """ 
{
  "id": "ISSUER_ID.OBJECT_ID",
  "classId": "ISSUER_ID.GENERIC_CLASS_ID",
  "cardTitle": {
    "defaultValue": {
      "language": "en",  
      "value": "Example"
    }
  },
  "subheader": {
    "defaultValue": {
      "language": "en",
      "value": "Attendee"
    }
  },
  "header": {
    "defaultValue": {
      "language": "en",
      "value": "Alex McJacobs"
    }
  },
  "barcode": {
    "type": "BARCODE_TYPE_UNSPECIFIED",
    "value": "BARCODE_VALUE",
    "alternateText": "POINTS"
  },
  "hexBackgroundColor": "#4285f4"
}
""";
```

See the example app for more examples.
