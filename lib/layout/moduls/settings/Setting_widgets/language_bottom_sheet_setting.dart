import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/layout/moduls/settings/Setting_widgets/selected_item.dart';
import 'package:untitled/layout/moduls/settings/Setting_widgets/unselected_item.dart';

import '../../../../Setting_Provider.dart';

class LanguageBottomSheetSetting extends StatelessWidget {
  const LanguageBottomSheetSetting({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              provider.selectArabicLanguage();
            },
            child: provider.currentLanguage == "ar"
                ? SelectedItem("عربي")
                : UnSelectedItem("عربي"),
          ),
          InkWell(
            onTap: () {
              provider.selectEnglishLanguage();
            },
            child: provider.currentLanguage == "en"
                ? SelectedItem("English")
                : UnSelectedItem("English"),
          ),
        ],
      ),
    );
  }
}
