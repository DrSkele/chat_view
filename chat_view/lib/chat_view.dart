library chat_view;

import 'dart:math';

import 'package:flutter/material.dart';

part 'chat_bubble.dart';
part 'chat_context.dart';
part 'chat_style.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  List<ChatContext> chats = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chats = List.generate(
        100,
        (index) =>
            ChatContext(id: index, context: '$index\n$index', thumbnail: null));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ChatBubble(
            chatContext: chats[index],
            isFirst: index == 0,
          );
        },
        itemCount: chats.length,
        reverse: true,
      ),
    );
  }
}
