import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:municipality_app/utils/colors.dart';

class CTAIconTextButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final double height, radius;
  final double? width;
  final double maxFontSize;
  final String icon;
  final bool ltr;
  final Color mainColor, secondaryColor, textColor;
  final BorderSide border;
  final TextStyle? textStyle;
  final bool overrideIconColor;

  CTAIconTextButton({
    required this.label,
    required this.onPressed,
    required this.icon,
    required this.ltr,
    this.overrideIconColor = true,
    this.width,
    this.radius = 6,
    this.mainColor = dPrimaryColor,
    this.secondaryColor = dPrimaryColor50,
    this.textColor = Colors.white,
    this.border = BorderSide.none,
    this.height = 55,
    this.maxFontSize = 18,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
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
            if (states.contains(MaterialState.disabled)) return Colors.grey;
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
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: SvgPicture.asset(
                icon,
                color: overrideIconColor ? textColor : null,
                width: 20,
                height: 20,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: AutoSizeText(
                label,
                style: textStyle?.copyWith(color: textColor) ??
                    Theme.of(context).textTheme.button?.copyWith(
                        color: onPressed == null ? Colors.white : textColor),
                maxFontSize: maxFontSize,
                minFontSize: 12,
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
            ),
          ],
        ),
        onPressed: onPressed,
      ),
    );
  }
}
