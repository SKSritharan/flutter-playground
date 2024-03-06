import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatBubble extends StatelessWidget {
  final String id;
  final bool isMe;
  final String text;
  final DateTime timestamp;
  const ChatBubble(
      {required this.id,
      required this.isMe,
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
              backgroundColor: isMe ? Colors.blue : Colors.green,
              child: isMe
                  ? const Icon(Icons.person, color: Colors.white)
                  : const Icon(Icons.computer, color: Colors.white),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  isMe ? 'You' : 'Bot',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isMe ? Colors.blue : Colors.green,
                    fontSize: 16.0,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: isMe ? Colors.blue.shade50 : Colors.green.shade50,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    text,
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    DateFormat.jm().format(timestamp),
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
