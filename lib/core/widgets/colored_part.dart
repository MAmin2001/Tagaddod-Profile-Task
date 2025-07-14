import 'package:flutter/material.dart';
import 'package:project/core/themes/colors_manager.dart';

class ColoredPart extends StatelessWidget {
  const ColoredPart({super.key, required this.child, required this.overlap});
  final Widget child;
  final double overlap;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(color: ColorsManager.mainColor),
        ),
        Positioned(bottom: -overlap, left: 0, right: 0, child: child),
      ],
    );
  }
}
