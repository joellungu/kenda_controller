import 'package:flutter/material.dart';

class OsIcons extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    // Adds a rectangle
    path.addOval(Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 1.2),
      radius: 10.0,
    ));
    //
    path.addOval(Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 6),
      radius: 10.0,
    ));

    path.addRect(
        Rect.fromLTWH(size.width / 2.5, size.height / 6, 5, size.height / 1.5));

    // path.addRect(Rect.fromLTWH(
    //     size.width / 1.2, size.height / 1.2, size.width / 3, size.height / 3));

    //
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
