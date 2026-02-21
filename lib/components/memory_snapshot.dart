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
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.red
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AspectRatio(
                aspectRatio: 1/1,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12)
                ),
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
