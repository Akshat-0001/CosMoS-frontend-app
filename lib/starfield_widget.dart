import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:ui';

class Star {
  Offset position;
  double brightness;

  Star(this.position, this.brightness);
}

class StarfieldWidget extends StatefulWidget {
  @override
  _StarfieldWidgetState createState() => _StarfieldWidgetState();
}

class _StarfieldWidgetState extends State<StarfieldWidget> {
  final Random _random = Random();
  final List<Star> _stars = [];
  final int _numberOfStars = 200; // Adjust for more or fewer stars
  Timer? _timer;
  Size? _screenSize;

  @override
  void initState() {
    super.initState();
    // Initialize the timer in initState, but don't generate stars yet
    _startTimer();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Now we can get the screen size and generate stars
    _screenSize = MediaQuery.of(context).size;
    _generateStars();
  }

  void _generateStars() {
    _stars.clear(); // Clear existing stars before generating new ones
    for (int i = 0; i < _numberOfStars; i++) {
      _stars.add(Star(
        Offset(_random.nextDouble() * _screenSize!.width,
            _random.nextDouble() * _screenSize!.height),
        _random.nextDouble(),
      ));
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 75), (timer) {
      setState(() {
        _generateStars(); // Regenerate stars to update positions and brightness
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: StarfieldPainter(stars: _stars),
      size: Size.infinite,
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

class StarfieldPainter extends CustomPainter {
  final List<Star> stars;

  StarfieldPainter({required this.stars});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    for (var star in stars) {
      paint.color = Colors.white.withOpacity(star.brightness); // Use brightness to adjust opacity
      canvas.drawCircle(star.position, 2.0, paint); // Adjust size as needed
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

