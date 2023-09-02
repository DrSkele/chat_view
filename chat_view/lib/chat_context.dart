part of chat_view;

class ChatContext {
  final int id;
  final String context;
  final Image? thumbnail;

  const ChatContext(
      {required this.id, required this.context, required this.thumbnail});
}
