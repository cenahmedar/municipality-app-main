import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:municipality_app/common/styles/styles.dart';
import 'package:municipality_app/utils/colors.dart';

class CTASecondaryButton extends StatefulWidget {
  final String label;
  final VoidCallback? onPressed;
  final double height;
  final bool light;
  final bool flat;
  final bool ltr;
  final double maxFontSize;

  CTASecondaryButton({
    required this.label,
    required this.onPressed,
    required this.ltr,
    this.height = 55,
    this.light = false,
    this.flat = true,
    this.maxFontSize = 18,
  });

  @override
  State<StatefulWidget> createState() => _CTASecondaryButtonState();
}

class _CTASecondaryButtonState extends State<CTASecondaryButton> {
  Color textColor = dTextColor;

  @override
  void initState() {
    if (widget.light)
      textColor = dTextColor;
    else if (widget.onPressed == null)
      textColor = Colors.grey;
    else
      textColor = dPrimaryColor;
    super.initState();
  }

  @override
  build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration:
          BoxDecoration(boxShadow: widget.flat ? [] : getDefaultShadow()),
      child: RawMaterialButton(
        padding: EdgeInsets.only(
          left: 21,
          right: 21,
          top: widget.ltr ? 3 : 0,
          bottom: 3,
        ),
        child: AutoSizeText(
          widget.label,
          style: Theme.of(context).textTheme.button?.copyWith(
                color: textColor,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
              ),
          maxFontSize: widget.maxFontSize,
          minFontSize: 12,
          maxLines: 1,
          overflow: TextOverflow.fade,
        ),
        onPressed: widget.onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        fillColor: widget.light
            ? dPrimaryColor
            : widget.onPressed == null
                ? Colors.grey
                : Colors.white,
        elevation: 0,
        highlightElevation: 0,
        splashColor: widget.light ? Colors.blueGrey : Colors.grey,
        highlightColor: widget.light
            ? Colors.white
            : widget.onPressed == null
                ? Colors.grey
                : dPrimaryColor,
        onHighlightChanged: (highlighted) => setState(
          () => textColor = highlighted
              ? (widget.light
                  ? widget.onPressed == null
                      ? Colors.grey
                      : dPrimaryColor
                  : Colors.white)
              : (widget.light
                  ? Colors.white
                  : widget.onPressed == null
                      ? Colors.grey
                      : dPrimaryColor),
        ),
      ),
    );
  }
}
