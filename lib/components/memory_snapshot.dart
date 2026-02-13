import 'package:flutter/material.dart';

class MemorySnapshot extends StatelessWidget {
  final String caption;
  final String imagePath;

  const MemorySnapshot({
    super.key,
    required this.caption,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AspectRatio(
                aspectRatio: 1/1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Text(caption),
            )
          ],
        ),
      ),
    );
  }
}
