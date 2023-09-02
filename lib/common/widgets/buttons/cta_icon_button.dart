import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:municipality_app/common/styles/styles.dart';
import 'package:municipality_app/utils/colors.dart';

class CTAIconButton extends StatefulWidget {
  final String label;
  final VoidCallback? onPressed;
  final double height;
  final bool flat;
  final double maxFontSize;
  final String icon;
  final bool ltr;

  CTAIconButton({
    required this.label,
    required this.icon,
    required this.onPressed,
    required this.ltr,
    this.maxFontSize = 18,
    this.height = 55,
    this.flat = true,
  });

  @override
  State<StatefulWidget> createState() => _CTAIconButtonState();
}

class _CTAIconButtonState extends State<CTAIconButton> {
  late Color textColor;

  @override
  void initState() {
    textColor = dTextColor;
    super.initState();
  }

  @override
  build(BuildContext context) {
    return Container(
      height: widget.height,
      // width: widget.width,
      decoration:
          BoxDecoration(boxShadow: widget.flat ? [] : getDefaultShadow()),
      child: RawMaterialButton(
        padding: EdgeInsets.only(
          left: widget.ltr ? 6 : 15,
          right: widget.ltr ? 15 : 6,
          top: 3,
          bottom: 3,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              widget.icon,
              color: textColor,
              width: 21,
              height: 21,
            ),
            SizedBox(width: 8),
            AutoSizeText(
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
          ],
        ),
        onPressed: widget.onPressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        fillColor: Colors.transparent,
        elevation: 0,
        highlightElevation: 0,
        splashColor: dPrimaryColor,
        highlightColor: dPrimaryColor,
        onHighlightChanged: (highlighted) => setState(
          () => textColor = highlighted ? Colors.white : dPrimaryColor,
        ),
      ),
    );
  }
}
