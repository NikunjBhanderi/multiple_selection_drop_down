#include "include/multiple_selection_drop_down/multiple_selection_drop_down_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "multiple_selection_drop_down_plugin.h"

void MultipleSelectionDropDownPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  multiple_selection_drop_down::MultipleSelectionDropDownPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
