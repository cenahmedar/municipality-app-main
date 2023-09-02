import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:municipality_app/utils/colors.dart';

import '../../styles/styles.dart';

class CTAWhiteButton extends StatefulWidget {
  final String label;
  final VoidCallback? onPressed;
  final double? height, width;
  final bool flat;

  CTAWhiteButton({
    required this.label,
    required this.onPressed,
    this.width = double.infinity,
    this.height = 55,
    this.flat = false,
  });

  @override
  State<StatefulWidget> createState() => _CTAWhiteButtonState();
}

class _CTAWhiteButtonState extends State<CTAWhiteButton> {
  late Color textColor;

  @override
  void initState() {
    textColor = dPrimaryColor;
    super.initState();
  }

  @override
  build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration:
          BoxDecoration(boxShadow: widget.flat ? [] : getDefaultShadow()),
      child: RawMaterialButton(
        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
        child: AutoSizeText(
          widget.label,
          style: Theme.of(context).textTheme.button?.copyWith(
                color: textColor,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
              ),
          maxFontSize: 18,
          minFontSize: 12,
          maxLines: 1,
          overflow: TextOverflow.fade,
        ),
        onPressed: widget.onPressed,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        fillColor: Colors.white,
        elevation: 0,
        highlightElevation: 0,
        splashColor: Colors.blueGrey,
        highlightColor: dPrimaryColor,
        onHighlightChanged: (highlighted) => setState(
          () => textColor = highlighted ? Colors.white : dPrimaryColor,
        ),
      ),
    );
  }
}
