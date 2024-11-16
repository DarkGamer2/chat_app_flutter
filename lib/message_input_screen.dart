import 'package:flutter/material.dart';

class MessageInputScreen extends StatelessWidget {
  final Function(String) onSendMessage;

  const MessageInputScreen({Key? key, required this.onSendMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: "Enter your message",
                labelText: "Message",
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final String message = controller.text;
                if (message.isNotEmpty) {
                  onSendMessage(message);
                  controller.clear();
                }
              },
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