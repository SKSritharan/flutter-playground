import 'package:ai_chat_bot/widgets/custom_text_composer.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import 'package:ai_chat_bot/models/chat_message.dart';
import 'package:ai_chat_bot/widgets/chat_bubble.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  static String? apiKey;
  late GenerativeModel model;

  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];

  @override
  void initState() {
    _initModel();
    super.initState();
  }

  void _initModel() async {
    apiKey = const String.fromEnvironment('API_KEY');
    model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey!);
  }

  void _handleSubmitted(String text) async {
    _textController.clear();
    ChatMessage message = ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: text,
      isMe: true,
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
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        text: "Error: Failed to generate response.",
        isMe: false,
        timestamp: DateTime.now(),
      );
      setState(() {
        _messages.insert(0, message);
      });
      throw error;
    }).then((value) {
      message = ChatMessage(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        text: value.text!,
        isMe: false,
        timestamp: DateTime.now(),
      );
      setState(() {
        _messages.insert(0, message);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AI Chat Bot',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                return ChatBubble(
                  id: _messages[index].id,
                  text: _messages[index].text,
                  isMe: _messages[index].isMe,
                  timestamp: _messages[index].timestamp,
                );
              },
            ),
          ),
          const SizedBox(height: 1),
          CustomTextComposer(
            hintText: 'Enter your message...',
            textController: _textController,
            handleSubmitted: _handleSubmitted,
          ),
        ],
      ),
    );
  }
}
