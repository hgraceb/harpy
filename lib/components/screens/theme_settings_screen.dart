import 'package:flutter/material.dart';
import 'package:harpy/components/widgets/shared/scaffolds.dart';
import 'package:harpy/components/widgets/theme/theme_card.dart';
import 'package:harpy/core/misc/harpy_theme.dart';
import 'package:harpy/models/settings/theme_settings_model.dart';

class ThemeSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HarpyScaffold(
      title: "Theme",
      body: ThemeSelection(),
    );
  }
}

/// Builds the [ThemeCard]s for selecting a different [HarpyTheme].
class ThemeSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeSettingsModel = ThemeSettingsModel.of(context);

    final themes = PredefinedThemes.themes;

    // load and add all custom themes
    themeSettingsModel.loadCustomThemes();
    themes.addAll(themeSettingsModel.customThemes.map((themeData) {
      return HarpyTheme.fromData(themeData);
    }));

    List<Widget> children = [];

    children.addAll(themes.map((harpyTheme) {
      return ThemeCard(
        harpyTheme: harpyTheme,
        id: themes.indexOf(harpyTheme),
      );
    }).toList());

    children.add(AddCustomThemeCard());

    return Container(
      padding: const EdgeInsets.all(8.0),
      width: double.infinity,
      child: SingleChildScrollView(
        child: Wrap(
          alignment: WrapAlignment.spaceEvenly,
          children: children,
        ),
      ),
    );
  }
}
