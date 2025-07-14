import 'package:flutter/material.dart';
import 'package:project/core/themes/colors_manager.dart';
import 'package:project/core/widgets/spaces.dart';

class EmailAndPhoneNumber extends StatelessWidget {
  const EmailAndPhoneNumber({
    super.key,
    required this.email,
    required this.phone,
  });
  final String email;
  final String phone;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          DetailsItem(icon: Icons.email_outlined, data: email),
          verticalSpace(height: 20),
          DetailsItem(icon: Icons.phone_outlined, data: phone),
        ],
      ),
    );
  }
}

class DetailsItem extends StatelessWidget {
  const DetailsItem({super.key, required this.icon, required this.data});
  final IconData icon;
  final String data;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: ColorsManager.mainColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(icon, size: 30, color: ColorsManager.mainColor),
        ),
        horizontalSpace(width: 10),
        Text(
          data,
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
