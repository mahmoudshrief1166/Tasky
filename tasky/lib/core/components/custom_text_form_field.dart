import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.title,
    required this.controller,
    this.validator,
    this.maxLines,
  });

  final String title;
  final String hintText;
  final TextEditingController controller;
  final int? maxLines;
  final Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: 8),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          style: Theme.of(context).textTheme.labelMedium,
          decoration: InputDecoration(hintText: hintText),
          validator: validator != null ? (String? value) => validator!(value) : null,
        ),
      ],
    );
  }
}
