import 'package:flutter/material.dart';

class TicketWid extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    // Adds a rectangle
    path.addArc(
        Rect.fromLTWH(size.width / 2.5, size.height / 6, 35, size.height / 1.5),
        size.width / 2,
        -10);
    //
    // path.addOval(Rect.fromCircle(
    //   center: Offset(size.width / 2, size.height / 1.2),
    //   radius: 10.0,
    // ));
    // path.addRect(Rect.fromLTWH(
    //     size.width / 2.5, size.height / 6, 35, size.height / 1.5));

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
