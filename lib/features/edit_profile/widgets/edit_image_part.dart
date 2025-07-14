import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/core/helpers/shared_prefs_consts.dart';
import 'package:project/core/helpers/shared_prefs_helper.dart';
import 'package:project/core/widgets/colored_part.dart';
import 'package:project/core/widgets/spaces.dart';

class EditImagePart extends StatefulWidget {
  const EditImagePart({super.key});

  @override
  State<EditImagePart> createState() => _EditImagePartState();
}

class _EditImagePartState extends State<EditImagePart> {
  File? _profileImage;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(
      source: source,
      imageQuality: 80,
    );
    if (pickedFile != null) {
      final imageFile = File(pickedFile.path);
      setState(() {
        _profileImage = imageFile;
      });
      await SharedPrefsHelper.saveData(
        SharedPrefsConsts.keyImage,
        imageFile.path,
      );
    }
  }

  void _showPickerOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder:
          (_) => SafeArea(
            child: Wrap(
              children: [
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Pick from Gallery'),
                  onTap: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.gallery);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Take a Photo'),
                  onTap: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.camera);
                  },
                ),
              ],
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ColoredPart(
          overlap: 80,
          child: GestureDetector(
            onTap: () => _showPickerOptions(context),
            child: CircleAvatar(
              radius: 75,
              backgroundColor: Colors.grey[300],
              backgroundImage:
                  _profileImage != null ? FileImage(_profileImage!) : null,
              child:
                  _profileImage == null
                      ? const Icon(
                        Icons.camera_alt,
                        size: 40,
                        color: Colors.grey,
                      )
                      : null,
            ),
          ),
        ),
        verticalSpace(height: 80),
      ],
    );
  }
}
