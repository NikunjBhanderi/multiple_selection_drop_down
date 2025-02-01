//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <multiple_selection_drop_down/multiple_selection_drop_down_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) multiple_selection_drop_down_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "MultipleSelectionDropDownPlugin");
  multiple_selection_drop_down_plugin_register_with_registrar(multiple_selection_drop_down_registrar);
}
