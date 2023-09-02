import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:municipality_app/models/payment_method.dart';

class PaymentLogoBadge extends StatelessWidget {
  final PaymentMethod paymentMethod;
  final bool shadowed;
  final EdgeInsets padding;
  final double height;
  final double width;
  final Color defaultColor;
  final double borderRadius;
  PaymentLogoBadge(
      {required this.paymentMethod,
      this.shadowed = true,
      this.padding = const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      this.height = 39,
      this.width = 66,
      this.defaultColor = Colors.white,
      this.borderRadius = 16});

  final Map<PaymentMethodType, Color> _colorValues = {
    PaymentMethodType.VISA: Color(0xFF172B85),
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      decoration: BoxDecoration(
        color: _colorValues[paymentMethod.type] ?? defaultColor,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: shadowed
            ? [
                BoxShadow(
                  color: Color(0xFFB6C6D4),
                  spreadRadius: 1,
                  blurRadius: 8,
                  offset: Offset(1, 1),
                ),
              ]
            : null,
      ),
      child: SvgPicture.asset(paymentMethod.logo),
    );
  }
}
