import 'package:flutter/material.dart';
import 'message_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MessageInputScreen(),
    );
  }
}

class MessageInputScreen extends StatefulWidget {
  const MessageInputScreen({Key? key}) : super(key: key);

  @override
  _MessageInputScreenState createState() => _MessageInputScreenState();
}

class _MessageInputScreenState extends State<MessageInputScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _messages = [];
  void _sendMessage() {
    final String message = _controller.text;
    if (message.isNotEmpty) {
      setState(() {
        _messages.add(message);
        _controller.clear();
      });
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MessageScreen(messages: _messages),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: "Enter your message",
                labelText: "Message",
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _sendMessage,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 12.0),
                textStyle: const TextStyle(fontSize: 16.0),
              ),
              child: const Text("Send"),
            ),
          ],
        ),
      ),
    );
  }
}
