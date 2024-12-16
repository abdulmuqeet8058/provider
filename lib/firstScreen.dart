import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_3/secondScreen.dart';
import 'package:task_3/themenotifier.dart';

class FirstScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Enter your username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            Text('Select Theme:'),
            DropdownButton<bool>(
              value: themeNotifier.isDarkTheme,
              items: [
                DropdownMenuItem(value: false, child: Text("Light")),
                DropdownMenuItem(value: true, child: Text("Dark")),
              ],
              onChanged: (value) async {
                await themeNotifier.setTheme(value!);
              },
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                if (usernameController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Username cannot be empty!")),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondScreen()),
                  );
                }
              },
              child: Text('Go to Second Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
