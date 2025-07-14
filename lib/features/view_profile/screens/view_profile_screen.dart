import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project/core/helpers/shared_prefs_consts.dart';
import 'package:project/core/helpers/shared_prefs_helper.dart';
import 'package:project/core/widgets/custom_text_button.dart';
import 'package:project/core/widgets/spaces.dart';
import 'package:project/features/edit_profile/screens/edit_profile_screen.dart';
import 'package:project/features/view_profile/widgets/email_and_phone.dart';
import 'package:project/features/view_profile/widgets/image_and_name.dart';

class ViewProfileScreen extends StatefulWidget {
  ViewProfileScreen({super.key});

  @override
  State<ViewProfileScreen> createState() => _ViewProfileScreenState();
}

class _ViewProfileScreenState extends State<ViewProfileScreen> {
  String name = 'Mahmoud Amin';

  String email = 'aminmahmoud843@gmail.com';

  String phone = '+201011722872';

  String imagePath = '';

  void loadUserData() {
    name = SharedPrefsHelper.getData(SharedPrefsConsts.keyName);
    email = SharedPrefsHelper.getData(SharedPrefsConsts.keyEmail);
    phone = SharedPrefsHelper.getData(SharedPrefsConsts.keyPhone);
    imagePath = SharedPrefsHelper.getData(SharedPrefsConsts.keyImage);
  }

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    final hasImage = imagePath.isNotEmpty && File(imagePath).existsSync();
    return Scaffold(
      body: Column(
        children: [
          ImageAndName(name: name, image: imagePath),
          verticalSpace(height: 150),
          EmailAndPhoneNumber(email: email, phone: phone),
          Spacer(),
          CustomTextButton(
            text: 'Edit',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfileScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
