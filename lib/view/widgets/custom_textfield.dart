import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final String? Function(String?)? validator;
  final RegExp? regex;
  final int? maxlength;
  final Icon icons;
  final  keyboardType;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.icons,
    this.validator,
    this.regex,
    this.maxlength, required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        prefixIcon: icons,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      ),
      validator: validator,
    );
  }
}

String? idValidate(String? value) {
  if (value == null || value.isEmpty) {
    return 'This field is required';
  }
  if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
    return 'Invalid ID Format';
  }
  return null;
}

String? nameValidate(String? value) {
  if (value == null || value.isEmpty) {
    return 'This field is required';
  }
  if (!RegExp(r'^[a-zA-Z_]+$').hasMatch(value)) {
    return 'Invalid Name format';
  }
  return null;
}

String? ageValidate(String? value) {
  if (value == null || value.isEmpty) {
    return 'This field is required';
  }
  if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
    return 'Invalid Age Format';
  }
  return null;
}

String? emailValidate(String? value) {
  if (value == null || value.isEmpty) {
    return 'This field is required';
  }
  if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
      .hasMatch(value)) {
    return 'Invalid Email format';
  }
  return null;
}

String? phoneValidate(String? value) {
  if (value == null || value.isEmpty) {
    return 'This field is required';
  }
  if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
    return 'Invalid Phone Format';
  }
  return null;
}
