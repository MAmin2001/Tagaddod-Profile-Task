import 'package:flutter/material.dart';
import 'package:project/core/themes/colors_manager.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.suffixIcon,
    this.inputType,
    this.isObscureText,
    this.titleColor,
    this.suffixColor,
    required this.validator,
    this.controller,
  });
  final TextEditingController? controller;
  final bool? isObscureText;
  final Color? titleColor;
  final Color? suffixColor;
  final String hintText;
  final Widget suffixIcon;
  final TextInputType? inputType;
  final Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscureText ?? false,
      keyboardType: inputType ?? TextInputType.visiblePassword,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
        suffixIcon: suffixIcon,
        suffixIconColor: suffixColor ?? Colors.grey,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.blueGrey, width: 3.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: ColorsManager.mainColor, width: 3.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.red, width: 3.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.red, width: 3.0),
        ),
      ),
      validator: (value) {
        return validator(value);
      },
    );
  }
}
