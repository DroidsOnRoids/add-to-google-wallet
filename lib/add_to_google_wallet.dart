import 'package:add_to_google_wallet/add_to_google_wallet_platform_interface.dart';

class AddToGoogleWallet {
  Future<void> saveLoyaltyPass(String pass) => AddToGoogleWalletPlatform.instance.saveLoyaltyPass(pass);
}
