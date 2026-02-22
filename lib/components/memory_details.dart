import 'package:flutter/material.dart';

class MemoryDetailsView extends StatelessWidget {

  const MemoryDetailsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.sizeOf(context).height * 0.5;
    final maxWidth = MediaQuery.sizeOf(context).width * 0.9;

    return Container(
      constraints: BoxConstraints(
        maxHeight: maxHeight,
        maxWidth: maxWidth
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24))
      ),
      child: Column(
        children: [
          Text('Hi'),
          Text('Hello')
        ],
      ),
    );
  }
}
