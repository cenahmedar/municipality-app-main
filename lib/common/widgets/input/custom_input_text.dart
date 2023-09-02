import 'package:flutter/material.dart';
import 'package:municipality_app/utils/colors.dart';

class CustomInputText extends StatelessWidget {
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final bool obscureText;
  final String hintText;
  final String? title;
  final int maxLines;
  final Function(String)? onChange;

  const CustomInputText({
    Key? key,
    this.title,
    this.keyboardType,
    this.controller,
    this.obscureText = false,
    this.onChange,
    this.maxLines = 1,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title?.isNotEmpty == true)
            Text(
              title ?? '',
              style:
                  Theme.of(context).textTheme.caption?.copyWith(fontSize: 17),
            ),
          TextField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
            maxLines: maxLines,
            minLines: 1,
            onChanged: onChange,
            decoration: InputDecoration(
                hintText: hintText,
                hintStyle: Theme.of(context)
                    .textTheme
                    .caption
                    ?.copyWith(color: KSilver, fontSize: 15)),
          ),
        ],
      ),
    );
  }
}
