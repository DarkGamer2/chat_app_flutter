import 'package:flutter/material.dart';
import 'settings.dart';
import 'message_input_screen.dart';
import 'message_screen.dart';

class BottomTabNavigator extends StatefulWidget {
  final bool isDarkMode;
  final Function(bool) onThemeChanged;

  const BottomTabNavigator(
      {super.key, required this.isDarkMode, required this.onThemeChanged});

  @override
  _BottomTabNavigatorState createState() => _BottomTabNavigatorState();
}

class _BottomTabNavigatorState extends State<BottomTabNavigator> {
  final List<String> _messages = [];

  void _addMessage(String message) {
    setState(() {
      _messages.add(message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: widget.isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Chat App"),
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.message), text: "Messages"),
                Tab(icon: Icon(Icons.settings), text: "Settings"),
                Tab(icon: Icon(Icons.send), text: "Send Message"),
              ],
            ),
          ),
          body: Container(
            color: widget.isDarkMode ? Colors.black : Colors.white,
            child: TabBarView(
              children: [
                MessageScreen(messages: _messages),
                Settings(
                  onThemeChanged: widget.onThemeChanged,
                  isDarkMode: widget.isDarkMode,
                ),
                MessageInputScreen(
                    onSendMessage: _addMessage, isDarkMode: widget.isDarkMode),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
