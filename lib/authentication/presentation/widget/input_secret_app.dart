import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dev_test/core/utils/app_colors.dart';
import 'package:flutter_dev_test/core/utils/app_gaps.dart';

class InputSecretApp extends StatefulWidget {
  const InputSecretApp(
      {super.key,
      required this.controller,
      this.onChanged,
      this.absoverPoint = false,
      this.focusNode});
  final TextEditingController controller;
  final Function(String)? onChanged;
  final bool absoverPoint;
  final FocusNode? focusNode;

  @override
  State<InputSecretApp> createState() => _InputSecretAppState();
}

class _InputSecretAppState extends State<InputSecretApp> {
  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: widget.absoverPoint,
      child: SizedBox(
        height: DSGaps.hapV90(context),
        width: DSGaps.gapH130(context),
        child: TextFormField(
          focusNode: widget.focusNode,
          onChanged: widget.onChanged,
          controller: widget.controller,
          textAlign: TextAlign.center,
          maxLength: 1,
          buildCounter: (_,
                  {required currentLength, required isFocused, maxLength}) =>
              null,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.shade300,
            contentPadding:
                const EdgeInsets.all(16), // Define o formato quadrado
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none, // Sem borda quando inativo
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none, // Sem borda quando inativo
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: AppColors.primary, // Cor da borda quando ativo
                width: 2.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
