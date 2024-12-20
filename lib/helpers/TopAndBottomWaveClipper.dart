import 'dart:ui';
import 'package:flutter/material.dart';

class TopAndBottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    // Top rounded wave
    path.moveTo(0, 90); // Start slightly down from the top-left corner
    path.quadraticBezierTo(
      size.width / 5, 0, // First control point
      size.width / 2, 40, // First end point
    );
    path.quadraticBezierTo(
      size.width * 3 / 4, 80, // Second control point
      size.width, 40, // Second end point
    );

    // Smooth corner from top-right to bottom-right
    path.quadraticBezierTo(
      size.width, size.height / 2, // Control point for smooth curve
      size.width, size.height - 90, // End point of the smooth curve
    );

    // Bottom rounded wave
    path.quadraticBezierTo(
      size.width * 3 / 4, size.height, // First control point
      size.width / 2, size.height - 40, // First end point
    );
    path.quadraticBezierTo(
      size.width / 4, size.height - 80, // Second control point
      0, size.height - 40, // Second end point
    );

    // Smooth corner from bottom-left to top-left
    path.quadraticBezierTo(
      0, size.height / 2, // Control point for smooth curve
      0, 40, // End point of the smooth curve
    );

    // Close the path
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
