import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_3/themenotifier.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            themeNotifier.toggleTheme();
          },
          child: Text('Toggle Theme'),
        ),
      ),
    );
  }
}
