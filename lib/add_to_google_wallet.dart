
import 'add_to_google_wallet_platform_interface.dart';

class AddToGoogleWallet {
  Future<String?> getPlatformVersion() {
    return AddToGoogleWalletPlatform.instance.getPlatformVersion();
  }
}
