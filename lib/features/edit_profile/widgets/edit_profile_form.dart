import 'package:flutter/material.dart';
import 'package:project/core/helpers/shared_prefs_consts.dart';
import 'package:project/core/helpers/shared_prefs_helper.dart';
import 'package:project/core/widgets/custom_text_button.dart';
import 'package:project/core/widgets/spaces.dart';
import 'package:project/features/edit_profile/widgets/custom_text_form_field.dart';
import 'package:project/features/view_profile/screens/view_profile_screen.dart';

class EditProfileForm extends StatelessWidget {
  EditProfileForm({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            CustomTextFormField(
              hintText: 'Edit your name',
              suffixIcon: const Icon(Icons.person),
              validator: validator,
              controller: nameController,
            ),
            verticalSpace(height: 20),
            CustomTextFormField(
              hintText: 'Edit your email',
              suffixIcon: Icon(Icons.email),
              validator: validator,
              controller: emailController,
            ),
            verticalSpace(height: 20),
            CustomTextFormField(
              hintText: 'Edit your phone number',
              suffixIcon: Icon(Icons.phone),
              validator: validator,
              controller: phoneController,
            ),
            verticalSpace(height: 50),
            CustomTextButton(
              text: 'Save',
              onPressed: () {
                saveUserData(nameController, emailController, phoneController);
                if (formKey.currentState!.validate()) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewProfileScreen(),
                    ),
                    (route) => false,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

String? validator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your data';
  }
  return null;
}

Future<void> saveUserData(
  dynamic nameController,
  dynamic emailController,
  dynamic phoneController,
) async {
  await SharedPrefsHelper.saveData(
    SharedPrefsConsts.keyName,
    nameController.text,
  );
  await SharedPrefsHelper.saveData(
    SharedPrefsConsts.keyEmail,
    emailController.text,
  );
  await SharedPrefsHelper.saveData(
    SharedPrefsConsts.keyPhone,
    phoneController.text,
  );
}
