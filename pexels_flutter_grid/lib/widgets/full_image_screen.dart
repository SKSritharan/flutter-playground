import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class FullImageScreen extends StatefulWidget {
  final String imagePath, imageTag;
  final int? backgroundOpacity;

  const FullImageScreen(
      {Key? key,
      required this.imagePath,
      required this.imageTag,
      this.backgroundOpacity})
      : super(key: key);

  @override
  State<FullImageScreen> createState() => _FullImageScreenState();
}

class _FullImageScreenState extends State<FullImageScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: Colors.black.withAlpha(
          widget.backgroundOpacity == null ? 220 : widget.backgroundOpacity!,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: widget.imageTag,
                child: Image.network(
                  widget.imagePath,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      LucideIcons.download,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      LucideIcons.share2,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
