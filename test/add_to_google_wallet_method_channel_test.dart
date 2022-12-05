import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:add_to_google_wallet/add_to_google_wallet_method_channel.dart';

void main() {
  MethodChannelAddToGoogleWallet platform = MethodChannelAddToGoogleWallet();
  const MethodChannel channel = MethodChannel('add_to_google_wallet');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
