import 'package:flutter/material.dart';
import 'starfield_widget.dart'; // Import the starfield_widget.dart for the background

class BackgroundWithStars extends StatelessWidget {
  final Widget child;

  BackgroundWithStars({required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(child: StarfieldWidget()),
        child, // Your panel content will be passed here
      ],
    );
  }
}
