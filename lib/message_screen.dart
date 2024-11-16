import "package:flutter/material.dart";

class MessageScreen extends StatelessWidget {
  final List<String> messages;
  const MessageScreen({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Messages")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child:
                Text(messages[index], style: const TextStyle(fontSize: 20.0)),
          );
        },
      ),
    );
  }
}
