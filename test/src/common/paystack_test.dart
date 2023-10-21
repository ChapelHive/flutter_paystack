import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_paystack/src/common/paystack.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const MethodChannel channel =
  MethodChannel('plugins.wilburt/flutter_paystack');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, (MethodCall methodCall) async {
      return '';
    });
  });

  tearDownAll(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  group("$PaystackPlugin", () {
    testWidgets('is properly initialized with passed key', (tester) async {
      var publicKey = Platform.environment["PAYSTACK_TEST_PUBLIC_KEY"] ?? "";
      final plugin = PaystackPlugin();
      await plugin.initialize(publicKey: publicKey);
      expect(publicKey, plugin.publicKey);
    });
  });
}
