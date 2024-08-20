import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_bubble_chat.dart';
import 'package:yes_no_app/presentation/widgets/chat/other_bubble_chat.dart';

import 'package:yes_no_app/presentation/widgets/shared/message_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Padding(
            padding: EdgeInsets.all(4.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRe5hVVP2qvL9JFd0LjL6YUDjimXxyf26rN5g&s'),
            ),
          ),
          title: const Text('Grandpa Rick'),
          centerTitle: false,
        ),
        body: _ChatView());
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              controller: chatProvider.scrollController,
              itemCount: chatProvider.messagesList.length,
              itemBuilder: (context, index) {
                final message = chatProvider.messagesList[index];
                return (message.fromWho == FromWho.me)
                    ? MyBubbleChat(
                        textMessage: message.text,
                      )
                    : OtherBubbleChat(
                        message: message,
                      );
              },
            )),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: MessageBox(
                  onValue: (value) =>
                      chatProvider.sendMessage(value, FromWho.me),
                ))
          ],
        ),
      ),
    );
  }
}
