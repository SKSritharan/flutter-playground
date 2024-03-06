class ChatMessage {
  final String id;
  final bool isMe;
  final String text;
  final DateTime timestamp;

  ChatMessage({
    required this.id,
    required this.isMe,
    required this.text,
    required this.timestamp,
  });
}
