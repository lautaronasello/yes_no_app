import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class OtherBubbleChat extends StatelessWidget {
  final Message message;
  const OtherBubbleChat({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.secondary, borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child:
                Text(message.text, style: TextStyle(color: colors.onSecondary)),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        _ImageBuilder(message.imageUrl)
      ],
    );
  }
}

class _ImageBuilder extends StatelessWidget {
  final String urlImage;

  const _ImageBuilder(this.urlImage);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        urlImage,
        width: size.width * 0.5,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
              width: size.width * 0.5,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const Text('Grandpa Rick is sending a message...'));
        },
      ),
    );
  }
}
