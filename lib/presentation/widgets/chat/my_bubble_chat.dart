import 'package:flutter/material.dart';

class MyBubbleChat extends StatelessWidget {
  final String textMessage;
  const MyBubbleChat({super.key, required this.textMessage});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
              color: colors.primary, borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Text(textMessage, style: TextStyle(color: colors.onPrimary)),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
