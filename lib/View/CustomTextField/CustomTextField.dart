import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final bool isRequired;
  final String? initialValue;
  final bool readOnly;
  final TextEditingController? controller;
  final bool enabled;
  final IconData? suffixIcon;
  final Color? suffixIconColor;

  const CustomTextFormField({
    Key? key,
    required this.labelText,
    required this.isRequired,
    this.initialValue,
    this.readOnly = false,
    this.controller,
    this.enabled = true,
    this.suffixIcon,
    this.suffixIconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20, bottom: 5),
          child: Row(
            children: [
              Text(
                labelText,
                style: TextStyle(color: Colors.black),
              ),
              if (isRequired)
                Text(
                  ' *',
                  style: TextStyle(color: Colors.red),
                ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            height: 50,
            child: TextFormField(
              controller: controller,
              initialValue: initialValue,
              readOnly: readOnly,
              enabled: enabled,
              style: TextStyle(color: controller?.text == labelText ? Color(0xFF00803E) : Color(0xFF00803E)),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xffDFDFDF),
                suffixIcon: suffixIcon != null
                    ? Icon(suffixIcon, color: suffixIconColor)
                    : null, // Color the suffix icon
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              validator: (value) {
                if (isRequired && (value == null || value.isEmpty)) {
                  return 'Please enter $labelText';
                }
                return null;
              },
            ),
          ),
        ),
      ],
    );
  }
}
