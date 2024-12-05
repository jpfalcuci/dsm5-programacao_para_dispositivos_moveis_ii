import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final IconData? icon;
  final Color? iconColor;
  final TextInputType? keyboardType;

  const Editor(
    {super.key, this.controller, this.label, this.hint, this.icon, this.iconColor, this.keyboardType}
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 36.0),
      child: TextField(
        controller: controller,
        style: const TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
          icon: icon != null ? Icon(
            icon, 
            color: iconColor ?? Colors.grey
          ) : null,
          labelText: label,
          hintText: hint,
        ),
        keyboardType: keyboardType ?? TextInputType.text,
      ),
    );
  }
}
