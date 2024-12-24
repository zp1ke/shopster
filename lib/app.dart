import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopster/common/styles/index.dart';
import 'package:shopster/features/authentication/screens/on_boarding.dart';
import 'package:shopster/features/routes.dart';
import 'package:shopster/l10n/app_l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      onGenerateTitle: (context) => AppL10n.of(context).appTitle,
      localizationsDelegates: AppL10n.localizationsDelegates,
      supportedLocales: AppL10n.supportedLocales,
      themeMode: ThemeMode.system,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      home: OnBoardingScreen(),
      getPages: appRoutes(),
    );
  }
}
