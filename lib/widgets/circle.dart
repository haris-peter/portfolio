// Created by: Haris Josin Peter, Created at: 07-03-2024 09:19 am

import 'package:flutter/material.dart';

class CircleWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final double outerRadius;
  final double innerRadius;
  final Color? circleColor;
  const CircleWidget(
      {super.key, required this.outerRadius, this.innerRadius = 0, this.circleColor, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(color: circleColor, borderRadius: BorderRadius.circular(outerRadius)),
      child: Center(
        child: Container(
          height: height! * 0.45,
          width: width! * 0.45,
          decoration: BoxDecoration(
            color: const Color(0XFF1a1a1a),
            borderRadius: BorderRadius.circular(innerRadius),
          ),
        ),
      ),
    );
  }
}
