import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/layout/moduls/settings/Setting_widgets/selected_item.dart';
import 'package:untitled/layout/moduls/settings/Setting_widgets/unselected_item.dart';

import '../../../../Setting_Provider.dart';

class ThemeBottomSheetSettings extends StatelessWidget {
  const ThemeBottomSheetSettings({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var provider = Provider.of<SettingsProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              provider.enableLightTheme();
            },
            child: provider.isDark()
                ? UnSelectedItem("Light")
                : SelectedItem("Light"),
          ),
          InkWell(
            onTap: () {
              provider.enableDarkTheme();
            },
            child: provider.isDark()
                ? SelectedItem("Dark")
                : UnSelectedItem("Dark"),
          ),
        ],
      ),
    );
  }
}
