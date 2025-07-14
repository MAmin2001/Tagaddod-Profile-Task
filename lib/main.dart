import 'package:flutter/material.dart';
import 'package:project/core/helpers/shared_prefs_helper.dart';
import 'package:project/profile_task.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefsHelper.init();
  runApp(const ProfileTask());
}
