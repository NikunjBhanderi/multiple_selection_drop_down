import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:multiple_selection_drop_down/multiple_selection_drop_down_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelMultipleSelectionDropDown platform = MethodChannelMultipleSelectionDropDown();
  const MethodChannel channel = MethodChannel('multiple_selection_drop_down');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
