import 'package:flutter/material.dart';
import 'package:project/core/widgets/spaces.dart';
import 'package:project/features/edit_profile/widgets/edit_image_part.dart';
import 'package:project/features/edit_profile/widgets/edit_profile_form.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            EditImagePart(),
            verticalSpace(height: 40),
            EditProfileForm(),
          ],
        ),
      ),
    );
  }
}
