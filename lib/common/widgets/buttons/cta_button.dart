import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:municipality_app/utils/colors.dart';

class CTAButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final double height, width, radius;
  final Color mainColor, secondaryColor, textColor;
  final BorderSide border;
  final double maxFontSize;
  final TextStyle? textStyle;

  const CTAButton({
    required this.label,
    required this.onPressed,
    this.width = double.infinity,
    this.height = 55,
    this.radius = 10,
    this.maxFontSize = 18,
    this.mainColor = dPrimaryColor,
    this.secondaryColor = dPrimaryColor50,
    this.textColor = Colors.white,
    this.border = BorderSide.none,
    this.textStyle,
  });

  @override
  build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) return Colors.white;
            return textColor;
          }),
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered) ||
                  states.contains(MaterialState.focused) ||
                  states.contains(MaterialState.pressed)) return secondaryColor;
              return mainColor; // Defer to the widget's default.
            },
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) return Colors.blueGrey;
            return mainColor;
          }),
          elevation: MaterialStateProperty.all<double>(0),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
              side: border,
            ),
          ),
        ),
        child: AutoSizeText(
          label,
          style: textStyle ??
              Theme.of(context).textTheme.button?.copyWith(
                  color: onPressed == null ? Colors.white : textColor),
          maxFontSize: maxFontSize,
          minFontSize: 12,
          maxLines: 1,
          overflow: TextOverflow.clip,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
