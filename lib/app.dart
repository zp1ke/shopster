import 'package:flutter/material.dart';
import 'package:shopster/common/styles/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Shopster'),
        ),
        body: const Center(
          child: Text('Hello, Shopster!'),
        ),
      ),
    );
  }
}
