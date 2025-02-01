import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'multiple_selection_drop_down_platform_interface.dart';

/// An implementation of [MultipleSelectionDropDownPlatform] that uses method channels.
class MethodChannelMultipleSelectionDropDown extends MultipleSelectionDropDownPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('multiple_selection_drop_down');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
