import 'dart:io';

import 'package:flutter/material.dart';

import 'package:project/core/widgets/colored_part.dart';
import 'package:project/core/widgets/spaces.dart';

class ImageAndName extends StatelessWidget {
  const ImageAndName({super.key, required this.name, required this.image});
  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return ColoredPart(
      overlap: 130,
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: FileImage(File(image)),
            backgroundColor: Colors.grey[300],
            radius: 75,
          ),
          verticalSpace(height: 20),
          Text(
            name,
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
