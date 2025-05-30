import 'package:flutter/material.dart';

class TextFormFieldComponent extends StatelessWidget {
  final String title;
  final String name;
  final String? description;
  final int? maxlines;
  final FormFieldValidator? validator;
  final TextEditingController controller;

  const TextFormFieldComponent({
    super.key,
    required this.title,
    required this.name,
    required this.controller,
    this.description,
    this.validator,
    this.maxlines,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: Theme.of(
            context,
          ).textTheme.displayMedium?.copyWith(fontSize: 16),
        ),
        SizedBox(height: 10),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: title,
            hintStyle: TextStyle(fontSize: 20),
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          ),
          validator: validator,
          maxLines: maxlines,
        ),
      ],
    );
  }
}
