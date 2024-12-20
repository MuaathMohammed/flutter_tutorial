
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/helpers/constants.dart';
import 'package:flutter_tutorial/themes/styles.dart';

class CustomGradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool? isBoxed;
  final bool? isRounded;
  final bool? isShaped;

  const CustomGradientButton({
    Key? key,
    required this.text,
    this.isBoxed,
    this.isRounded,
    this.isShaped,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: defaultPadding,horizontal: 20.0),
        decoration:
        isBoxed==true?
        ThemeDecorations.gradientBoxDecoration(context):
        isShaped==true?
        ThemeDecorations.gradientBox(context):
        isRounded==true?
        ThemeDecorations.gradientRoundedButton(context):
        ThemeDecorations.gradientButton(context),
        child: Center(
          child: Text(
            text,
            style:AppTextStyle.h1Big,
          ),
        ),
      ),
    );
  }
}
class AnimatedWaveButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  const AnimatedWaveButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  _AnimatedWaveButtonState createState() => _AnimatedWaveButtonState();
}

class _AnimatedWaveButtonState extends State<AnimatedWaveButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: CustomPaint(
        painter: WavePainter(animation: _controller),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class WavePainter extends CustomPainter {
  final Animation<double> animation;

  WavePainter({required this.animation}) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.3)
      ..style = PaintingStyle.fill;

    final path = Path();

    double waveHeight = 10;
    double waveWidth = size.width / 4;
    double animationValue = animation.value * waveWidth;

    path.moveTo(0, size.height);
    for (double i = 0; i <= size.width; i += waveWidth) {
      path.quadraticBezierTo(
        i + waveWidth / 4 - animationValue,
        size.height - waveHeight,
        i + waveWidth / 2 - animationValue,
        size.height,
      );
      path.quadraticBezierTo(
        i + 3 * waveWidth / 4 - animationValue,
        size.height + waveHeight,
        i + waveWidth - animationValue,
        size.height,
      );
    }
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}