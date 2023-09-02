part of chat_view;

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.chatContext,
    this.style = const ChatLineStyle(),
    required this.isFirst,
  });

  final ChatContext chatContext;
  final ChatLineStyle style;
  final bool isFirst;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: style.profileImage.size.height,
          width: style.profileImage.size.width,
          decoration: style.profileImage.decoration,
        ),
        CustomPaint(
          painter: style.speechBubble.customPainter ??
              CustomBubble(
                bubbleColor: style.speechBubble.bubbleColor,
                bubbleRadius: style.speechBubble.bubbleRadius,
                tailLength: style.speechBubble.tailLength,
                isFirst: isFirst,
              ),
          child: Padding(
            padding: style.speechBubble.bubblePadding +
                EdgeInsets.only(left: style.speechBubble.tailLength),
            child: Text(
              chatContext.context,
              style: style.speechBubble.style,
            ),
          ),
        )
      ],
    );
  }
}

class CustomBubble extends CustomPainter {
  const CustomBubble({
    required this.bubbleColor,
    required this.bubbleRadius,
    required this.tailLength,
    required this.isFirst,
  });

  final Color bubbleColor;
  final double bubbleRadius;
  final double tailLength;
  final bool isFirst;

  Path _drawBubbleWithSpike(Size size) {
    final h = size.height;
    final w = size.width - tailLength;

    const tailEdgeRadius = 2.0;
    final spike = tailEdgeRadius * sqrt(2);

    var path = Path()
      ..moveTo(0 + tailLength, bubbleRadius)
      ..lineTo(0 + tailLength, h - bubbleRadius) //left line
      ..quadraticBezierTo(
          0 + tailLength, h, bubbleRadius + tailLength, h) //lower left corner
      ..lineTo(w - bubbleRadius + tailLength, h) //bottom line
      ..quadraticBezierTo(w + tailLength, h, w + tailLength,
          h - bubbleRadius) //lower right corner
      ..lineTo(w + tailLength, bubbleRadius) //right line
      ..quadraticBezierTo(w + tailLength, 0, w - bubbleRadius + tailLength,
          0) //upper right corner
      ..lineTo(spike, 0) //top line
      ..quadraticBezierTo(
          0, 0, 0 + tailEdgeRadius, tailEdgeRadius) //spike corner
      ..lineTo(0 + tailLength, bubbleRadius) //spike side
      ..close();
    return path;
  }

  Path _drawBubble(Size size) {
    final h = size.height;
    final w = size.width - tailLength;

    var path = Path()
      ..moveTo(0 + tailLength, bubbleRadius)
      ..lineTo(0 + tailLength, h - bubbleRadius) //left line
      ..quadraticBezierTo(
          0 + tailLength, h, bubbleRadius + tailLength, h) //lower left corner
      ..lineTo(w - bubbleRadius + tailLength, h) //bottom line
      ..quadraticBezierTo(w + tailLength, h, w + tailLength,
          h - bubbleRadius) //lower right corner
      ..lineTo(w + tailLength, bubbleRadius) //right line
      ..quadraticBezierTo(w + tailLength, 0, w - bubbleRadius + tailLength,
          0) //upper right corner
      ..lineTo(bubbleRadius + tailLength, 0) //top line
      ..quadraticBezierTo(
          0 + tailLength, 0, 0 + tailLength, bubbleRadius) //upper left corner
      ..close();

    return path;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = bubbleColor;
    canvas.drawPath(
      isFirst ? _drawBubbleWithSpike(size) : _drawBubble(size),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
