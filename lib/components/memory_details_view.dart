import 'package:flutter/material.dart';

class MemoryDetailsView extends StatelessWidget {
  final caption;
  final imagePath;
  final description;

  const MemoryDetailsView({
    super.key,
    required this.caption,
    required this.imagePath,
    required this.description
  });

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double desiredWidth = screenSize.width * 0.85;
    final double desiredHeight = screenSize.height * 0.65;

    return Center(
      child: SizedBox(
        width: desiredWidth,
        height: desiredHeight,
        child: Material(
          borderRadius: BorderRadius.circular(12),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              // Image (fixed size)
              AspectRatio(
                aspectRatio: 1 / 1,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),

              // Scrollable content area
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        caption,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        description,
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.edit_outlined)
                  ),
                  IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.delete_outline)
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
