import 'package:flutter_test/flutter_test.dart';
import 'package:multiple_selection_drop_down/multiple_selection_drop_down.dart';
import 'package:multiple_selection_drop_down/multiple_selection_drop_down_platform_interface.dart';
import 'package:multiple_selection_drop_down/multiple_selection_drop_down_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMultipleSelectionDropDownPlatform
    with MockPlatformInterfaceMixin
    implements MultipleSelectionDropDownPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final MultipleSelectionDropDownPlatform initialPlatform = MultipleSelectionDropDownPlatform.instance;

  test('$MethodChannelMultipleSelectionDropDown is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMultipleSelectionDropDown>());
  });

  test('getPlatformVersion', () async {
    MultipleSelectionDropDown multipleSelectionDropDownPlugin = MultipleSelectionDropDown();
    MockMultipleSelectionDropDownPlatform fakePlatform = MockMultipleSelectionDropDownPlatform();
    MultipleSelectionDropDownPlatform.instance = fakePlatform;

    expect(await multipleSelectionDropDownPlugin.getPlatformVersion(), '42');
  });
}
