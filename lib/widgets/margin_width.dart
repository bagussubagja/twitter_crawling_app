import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MarginWidth extends StatelessWidget {
  double width;
  MarginWidth({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}
