import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:municipality_app/generated/i18n.dart';
import 'package:municipality_app/models/bill.dart';

class MoneyAmountCardWidget extends StatelessWidget {
  // final Bill bill;
  // final double total;
  final VoidCallback onClick;
  final String sourcePage;
  final String? title;
  final String titleValue;
  final String amount;

  MoneyAmountCardWidget({
    required this.titleValue,
    required this.amount,
    required this.sourcePage,
    this.title,
    required this.onClick,
  });

  List<Widget> _getAmount(BuildContext context) {
    return [
      Row(
        children: [
          Text(amount),
          SizedBox(width: 8),
          Text(I18n.of(context)!.shekels),
        ],
      ),
    ];
  }

  List<Widget> _getDescription(BuildContext context) {
    return [
      Row(
        children: [
          ...(title != null ? [Text(title!), SizedBox(width: 8)] : []),
          Text(titleValue),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        margin: EdgeInsets.only(bottom: 17, left: 3, right: 3),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(19),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFB6C6D4),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ..._getDescription(context),
            // Text(bill.invoiceNo ?? ''),
            // Expanded(child: SizedBox()),
            // ..._getDate(),
            Expanded(child: SizedBox()),

            ..._getAmount(context),
            // ..._getCircularIndicator(),
            // SizedBox(
            //   width: 8,
            // ),
            Icon(Icons.chevron_right_sharp)
          ],
        ),
      ),
    );
  }
}
