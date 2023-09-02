import 'package:flutter/material.dart';
import 'package:municipality_app/utils/validation_extensions.dart';

class PasswordInputField extends StatefulWidget {
  final TextEditingController passwordController;
  final TextInputAction textInputAction;
  final Function(String)? onSubmitted;
  final String hint;
  final bool autofocus;
  final FocusNode? node;

  PasswordInputField({
    required this.passwordController,
    required this.textInputAction,
    required this.hint,
    this.onSubmitted,
    this.autofocus = false,
    this.node,
  });

  @override
  PasswordInputState createState() => PasswordInputState();
}

class PasswordInputState extends State<PasswordInputField> {
  String? passwordValidation(String? v) => [v.isPassword()].validate();

  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: widget.node,
      obscureText: obscure,
      enableSuggestions: false,
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.center,
      autocorrect: false,
      textInputAction: widget.textInputAction,
      onFieldSubmitted: widget.onSubmitted,
      autofocus: widget.autofocus,
      decoration: InputDecoration(
          hintText: widget.hint,
          suffixIcon: IconButton(
            icon: Icon(
              obscure ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey.shade300,
              size: 18,
            ),
            onPressed: () => setState(() => obscure = !obscure),
          )),
      validator: passwordValidation,
      controller: widget.passwordController,
    );
  }
}
