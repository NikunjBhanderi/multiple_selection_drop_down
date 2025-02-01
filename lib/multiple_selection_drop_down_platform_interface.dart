import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'multiple_selection_drop_down_method_channel.dart';

abstract class MultipleSelectionDropDownPlatform extends PlatformInterface {
  /// Constructs a MultipleSelectionDropDownPlatform.
  MultipleSelectionDropDownPlatform() : super(token: _token);

  static final Object _token = Object();

  static MultipleSelectionDropDownPlatform _instance = MethodChannelMultipleSelectionDropDown();

  /// The default instance of [MultipleSelectionDropDownPlatform] to use.
  ///
  /// Defaults to [MethodChannelMultipleSelectionDropDown].
  static MultipleSelectionDropDownPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MultipleSelectionDropDownPlatform] when
  /// they register themselves.
  static set instance(MultipleSelectionDropDownPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
