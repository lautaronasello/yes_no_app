import 'package:flutter/material.dart';

class MessageBox extends StatelessWidget {
  final ValueChanged onValue;

  const MessageBox({
    super.key,
    required this.onValue,
  });
  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;

    final TextEditingController textController = TextEditingController();

    final outlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));

    final FocusNode focusNode = FocusNode();

    final InputDecoration inputDecoration = InputDecoration(
        hintText: 'End your message with a "?"',
        filled: true,
        fillColor: theme.primary,
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        suffixIcon: IconButton(
          icon: Icon(Icons.send, color: theme.onPrimary),
          onPressed: () {
            final textValue = textController.value.text;
            if (textValue.isEmpty) return;
            onValue(textValue);
            textController.clear();
            focusNode.requestFocus();
          },
        ));

    return TextFormField(
      onTapOutside: (event) => {focusNode.unfocus()},
      decoration: inputDecoration,
      controller: textController,
      focusNode: focusNode,
      cursorColor: theme.onPrimary,
      onFieldSubmitted: (value) {
        if (value.isEmpty) return;
        onValue(value);
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}
