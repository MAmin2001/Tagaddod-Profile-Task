import 'package:flutter/material.dart';
import 'package:project/core/themes/colors_manager.dart';
import 'package:project/features/view_profile/screens/view_profile_screen.dart';

class ProfileTask extends StatelessWidget {
  const ProfileTask({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ProfileTask',
      theme: ThemeData(primaryColor: ColorsManager.mainColor),
      home: ViewProfileScreen(),
    );
  }
}
