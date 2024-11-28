import 'package:flutter/material.dart';

class AppTextFromFieldWidget extends StatefulWidget {
  const AppTextFromFieldWidget(
      {super.key,
      this.onChanged,
      required this.hintText,
      this.controller,
      this.suffix,
      this.isVisibilityPasswrod = false});
  final Function(String)? onChanged;
  final String hintText;
  final TextEditingController? controller;
  final Widget? suffix;
  final bool isVisibilityPasswrod;

  @override
  State<AppTextFromFieldWidget> createState() => _AppTextFromFieldWidgetState();
}

class _AppTextFromFieldWidgetState extends State<AppTextFromFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isVisibilityPasswrod,
      onChanged: widget.onChanged,
      controller: widget.controller,
      decoration: InputDecoration(
        suffix: widget.suffix,
        hintText: widget.hintText,
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.transparent,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
