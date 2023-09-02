import 'package:flutter/material.dart';

class StandardInput extends StatelessWidget {
  final TextEditingController controller;

  const StandardInput({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.text,
      style: Theme.of(context)
          .textTheme
          .bodyText1
          // ?.copyWith(color: ColorStyle.nileBlue),
    );
  }
}
