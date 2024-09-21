import 'package:flutter/material.dart';

class CustomTextFormFieldSearch extends StatelessWidget {
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function()? onPressedPrefixIcon;
  final Color? fillColor;
  final String? hintText;
  const CustomTextFormFieldSearch(
      {Key? key,
      this.controller,
      this.onChanged,
      this.onPressedPrefixIcon,
      this.fillColor,
      this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      style: const TextStyle(height: 0.9),
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(fontWeight: FontWeight.w500),
          prefixIcon: IconButton(
            icon: const Icon(Icons.search),
            onPressed: onPressedPrefixIcon,
          ),
          fillColor: fillColor,
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none)),
    );
  }
}
