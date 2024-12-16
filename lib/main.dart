import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_3/firstScreen.dart';
import 'package:task_3/themenotifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final themeNotifier = ThemeNotifier();
  await themeNotifier.loadThemePreference();

  runApp(
    ChangeNotifierProvider(
      create: (_) => themeNotifier,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return MaterialApp(
      title: 'Dynamic Theme Demo',
      theme: themeNotifier.currentTheme,
      home: FirstScreen(),
    );
  }
}
