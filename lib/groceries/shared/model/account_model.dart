
import 'package:flutter/material.dart';

class AccountModel {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  AccountModel({
    required this.icon,
    required this.title,
    required this.onTap,
  });
}
