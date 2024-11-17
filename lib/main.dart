import 'package:flutter/material.dart';
import 'bottom_tab_navigator.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool isDarkMode = false;

  void changeTheme(bool isDark) {
    setState(() {
      isDarkMode = isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: BottomTabNavigator(
        isDarkMode: isDarkMode,
        onThemeChanged: changeTheme,
      ),
    );
  }
}
