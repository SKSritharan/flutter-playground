import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import 'package:ai_chat_bot/widgets/chat_message.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  static const String apiKey = 'AIzaSyD6vlXIWt9qsCuGLsHdnT-Ncd9Vah3hoYo';

  final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);

  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];

  void _handleSubmitted(String text) async {
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
      name: "User",
      timestamp: DateTime.now(),
    );

    setState(() {
      _messages.insert(0, message);
    });

    final content = [Content.text(text)];

    await model.generateContent(content).onError((error, stackTrace) {
      return Future.error(error!);
    }).catchError((error) {
      message = ChatMessage(
        text: "Error: Failed to generate response.",
        name: "AI",
        timestamp: DateTime.now(),
      );
      setState(() {
        _messages.insert(0, message);
      });
    }).then((value) {
      message = ChatMessage(
        text: value.text!,
        name: "AI",
        timestamp: DateTime.now(),
      );
      setState(() {
        _messages.insert(0, message);
      });
    });
  }

  Widget _buildTextComposer() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextField(
              controller: _textController,
              onSubmitted: _handleSubmitted,
              decoration: const InputDecoration.collapsed(
                hintText: 'Enter your message...',
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () => _handleSubmitted(_textController.text),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Chat Bot'),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                return _messages[index];
              },
            ),
          ),
          const Divider(height: 1.0),
          _buildTextComposer(),
        ],
      ),
    );
  }
}
