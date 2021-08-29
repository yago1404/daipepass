import 'package:flutter/cupertino.dart';

class PlatformData {
  String title;
  String password;
  String email;
  String username;
  Color color;

  PlatformData({
    required this.email,
    required this.username,
    required this.password,
    required this.title,
    required this.color,
  });
}
