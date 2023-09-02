import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:municipality_app/generated/i18n.dart';
import 'package:municipality_app/models/payment_method.dart';
import 'package:municipality_app/widgets/payment_logo_badge.dart';

class PaymentMethodDropdown extends StatelessWidget {
  final Function(PaymentMethodType?) onChanged;
  final PaymentMethodType value;
  PaymentMethodDropdown({required this.onChanged, required this.value});

  final List<PaymentMethod> _paymentMethods =
      PaymentMethod.getAllPaymentMethods();
  @override
  Widget build(BuildContext context) {
    return DropdownButton<PaymentMethodType>(
      value: value,
      isExpanded: true,
      icon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: SvgPicture.asset('assets/icons/custom_arrow_down.svg'),
      ),
      elevation: 16,
      alignment: Alignment.center,
      style: TextStyle(
        color: Colors.black,
        fontSize: 14,
      ),
      underline: Container(
        height: 2,
        color: Color(0xFFD2D2D2),
      ),
      onChanged: onChanged,
      items: _paymentMethods
          .map<DropdownMenuItem<PaymentMethodType>>((PaymentMethod value) {
        return DropdownMenuItem<PaymentMethodType>(
          value: value.type,
          child: Row(
            children: [
              PaymentLogoBadge(
                paymentMethod: value,
                shadowed: false,
                defaultColor: Colors.transparent,
                height: 32,
                width: 44,
                borderRadius: 12,
              ),
              SizedBox(
                width: 22,
              ),
              Text(
                value.type.name,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
