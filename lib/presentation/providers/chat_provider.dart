import 'package:flutter/material.dart';
import 'package:yes_no_app/config/themes/helpers/get_yes_no_ans.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();
  final GetYesNoAns getYesNoAns = GetYesNoAns();
  List<Message> messagesList = [];

  Future<void> sendMessage(String text, FromWho fromWho) async {
    messagesList.add(Message(text: text, fromWho: fromWho, imageUrl: ''));
    if (text.endsWith('?')) {
      await hisReply();
    }
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> hisReply() async {
    final hisMessage = await getYesNoAns.getAnswer();
    messagesList.add(hisMessage);
    notifyListeners();
    await moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    scrollController.animateTo(scrollController.position.maxScrollExtent + 800,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  }
}
