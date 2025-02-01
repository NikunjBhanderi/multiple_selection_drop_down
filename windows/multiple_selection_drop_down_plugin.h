#ifndef FLUTTER_PLUGIN_MULTIPLE_SELECTION_DROP_DOWN_PLUGIN_H_
#define FLUTTER_PLUGIN_MULTIPLE_SELECTION_DROP_DOWN_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace multiple_selection_drop_down {

class MultipleSelectionDropDownPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  MultipleSelectionDropDownPlugin();

  virtual ~MultipleSelectionDropDownPlugin();

  // Disallow copy and assign.
  MultipleSelectionDropDownPlugin(const MultipleSelectionDropDownPlugin&) = delete;
  MultipleSelectionDropDownPlugin& operator=(const MultipleSelectionDropDownPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace multiple_selection_drop_down

#endif  // FLUTTER_PLUGIN_MULTIPLE_SELECTION_DROP_DOWN_PLUGIN_H_
