part of chat_view;

class ChatStyle {}

class ProfileImage {
  final Size size;
  final BoxDecoration decoration;

  const ProfileImage({
    this.size = const Size(30, 30),
    this.decoration = const BoxDecoration(shape: BoxShape.circle),
  });
}

class SpeechBubble {
  final TextStyle style;

  final Color bubbleColor;
  final double tailLength;
  final double bubbleRadius;
  final CustomPainter? customPainter;

  final EdgeInsets bubblePadding;

  const SpeechBubble({
    this.style = const TextStyle(),
    this.bubbleColor = Colors.greenAccent,
    this.tailLength = 8.0,
    this.bubbleRadius = 8.0,
    this.customPainter,
    this.bubblePadding =
        const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
  });
}

class ChatLineStyle {
  final ProfileImage profileImage;
  final SpeechBubble speechBubble;

  const ChatLineStyle({
    this.profileImage = const ProfileImage(),
    this.speechBubble = const SpeechBubble(),
  });
}
