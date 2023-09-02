import 'package:flutter/material.dart';
import 'package:municipality_app/common/styles/styles.dart';
import 'package:municipality_app/utils/colors.dart';

class DefaultCard extends StatelessWidget {
  final Widget child;
  final List<BoxShadow>? shadow;
  final Color? borderColor;
  final Color? cardColor;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final double? width;
  final Alignment? alignment;

  const DefaultCard({
    required this.child,
    this.shadow,
    this.borderColor,
    this.cardColor,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.width,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: shadow ?? getDefaultShadow(),
        border: Border.all(color: borderColor ?? dPrimaryColor),
        color: cardColor ?? Colors.white,
      ),
      padding: padding,
      margin: margin,
      width: width,
      alignment: alignment,
      child: child,
    );
  }
}
