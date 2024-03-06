import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String name;
  final String text;
  final DateTime timestamp;

  const ChatMessage(
      {required this.name,
      required this.text,
      required this.timestamp,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              child: Text(name[0]),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                name,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: Text(text),
              ),
              Text(
                timestamp.microsecondsSinceEpoch.toString(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
