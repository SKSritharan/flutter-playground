import 'package:flutter/material.dart';

class CustomTextComposer extends StatelessWidget {
  final String hintText;
  final TextEditingController textController;
  final void Function(String) handleSubmitted;

  const CustomTextComposer({
    required this.hintText,
    required this.textController,
    required this.handleSubmitted,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1.0),
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: textController,
              onSubmitted: handleSubmitted,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: Colors.grey,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          Material(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(24.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(24.0),
              onTap: () => handleSubmitted(textController.text),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.send,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
