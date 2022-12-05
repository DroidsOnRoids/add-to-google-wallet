import 'package:flutter_test/flutter_test.dart';
import 'package:add_to_google_wallet/add_to_google_wallet.dart';
import 'package:add_to_google_wallet/add_to_google_wallet_platform_interface.dart';
import 'package:add_to_google_wallet/add_to_google_wallet_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAddToGoogleWalletPlatform
    with MockPlatformInterfaceMixin
    implements AddToGoogleWalletPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AddToGoogleWalletPlatform initialPlatform = AddToGoogleWalletPlatform.instance;

  test('$MethodChannelAddToGoogleWallet is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAddToGoogleWallet>());
  });

  test('getPlatformVersion', () async {
    AddToGoogleWallet addToGoogleWalletPlugin = AddToGoogleWallet();
    MockAddToGoogleWalletPlatform fakePlatform = MockAddToGoogleWalletPlatform();
    AddToGoogleWalletPlatform.instance = fakePlatform;

    expect(await addToGoogleWalletPlugin.getPlatformVersion(), '42');
  });
}
