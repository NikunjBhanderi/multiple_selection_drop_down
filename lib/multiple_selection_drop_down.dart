
import 'multiple_selection_drop_down_platform_interface.dart';

class MultipleSelectionDropDown {
  Future<String?> getPlatformVersion() {
    return MultipleSelectionDropDownPlatform.instance.getPlatformVersion();
  }
}
