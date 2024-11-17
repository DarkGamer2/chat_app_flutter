import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  final Function(bool) onThemeChanged;
  final bool isDarkMode;

  const Settings(
      {super.key, required this.onThemeChanged, required this.isDarkMode});

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Settings"),
            const Text("Dark Mode"),
            Switch(
              value: widget.isDarkMode,
              onChanged: (value) {
                widget.onThemeChanged(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
