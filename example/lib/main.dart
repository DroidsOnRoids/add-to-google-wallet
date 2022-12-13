import 'package:add_to_google_wallet/widgets/add_to_google_wallet_button.dart';
import 'package:flutter/material.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: ScaffoldMessenger(
          key: scaffoldMessengerKey,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Plugin example app'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AddToGoogleWalletButton(
                    pass: _examplePass,
                    onError: (Object error) => _onError(context, error),
                    onSuccess: () => _onSuccess(context),
                    onCanceled: () => _onCanceled(context),
                    // Unsupported locale. Button will display English version.
                    locale: const Locale('ab'),
                  ),
                  const SizedBox(height: 8.0),
                  AddToGoogleWalletButton(
                    pass: _examplePass,
                    onError: (Object error) => _onError(context, error),
                    onSuccess: () => _onSuccess(context),
                    onCanceled: () => _onCanceled(context),
                    locale: const Locale.fromSubtags(languageCode: 'fr', countryCode: 'FR'),
                  ),
                  const SizedBox(height: 8.0),
                  AddToGoogleWalletButton(
                    pass: _examplePass,
                    onError: (Object error) => _onError(context, error),
                    onSuccess: () => _onSuccess(context),
                    onCanceled: () => _onCanceled(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  void _onError(BuildContext context, Object error) => scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(error.toString()),
        ),
      );

  void _onSuccess(BuildContext context) => scaffoldMessengerKey.currentState?.showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text('Pass has been successfully added to the Google Wallet.'),
        ),
      );

  void _onCanceled(BuildContext context) => scaffoldMessengerKey.currentState?.showSnackBar(
        const SnackBar(
          backgroundColor: Colors.yellow,
          content: Text('Adding a pass has been canceled.'),
        ),
      );
}

final String _examplePass = """
    {
      "iss": "example@example.com",
      "aud": "google",
      "typ": "savetowallet",
      "iat": ${DateTime.now().millisecondsSinceEpoch},
      "origins": [],
      "payload": {
        "genericObjects": [
          {
            "id": "3378000000012184345.89a231pl-4477-9d33-8b44-9088mpp3122g0",
            "classId": "3378000000012184345.36b814de-4774-4a12-8a1d-4211d88daac9",
            "genericType": "GENERIC_TYPE_UNSPECIFIED",
            "hexBackgroundColor": "#4285f4",
            "logo": {
              "sourceUri": {
                "uri": "https://storage.googleapis.com/wallet-lab-tools-codelab-artifacts-public/pass_google_logo.jpg"
              }
            },
            "cardTitle": {
              "defaultValue": {
                "language": "en",
                "value": "Google I/O '22  [DEMO ONLY]"
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
              "type": "QR_CODE",
              "value": "4444"
            },
            "heroImage": {
              "sourceUri": {
                "uri": "https://storage.googleapis.com/wallet-lab-tools-codelab-artifacts-public/google-io-hero-demo-only.jpg"
              }
            },
            "textModulesData": [
              {
                "header": "POINTS",
                "body": "1234",
                "id": "points"
              },
              {
                "header": "CONTACTS",
                "body": "33",
                "id": "contacts"
              }
            ]
          }
        ]
      }
    }
""";
