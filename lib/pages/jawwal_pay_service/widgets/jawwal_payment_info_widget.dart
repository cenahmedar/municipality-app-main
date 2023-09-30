import 'package:flutter/material.dart';

import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';
import '../../../utils/colors.dart';

class JawwalPaymentInfo extends StatefulWidget {
  final String amount;
  JawwalPaymentInfo({required this.amount, Key? key}) : super(key: key);

  @override
  State<JawwalPaymentInfo> createState() => _JawwalPaymentInfoState();
}

class _JawwalPaymentInfoState extends State<JawwalPaymentInfo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppPadding.p8),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(AppPadding.p2),
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: AppSize.s8),
            child: getLabelInfoRow("Transaction Type", "Online Payment"),
          ),
          Container(
            padding: EdgeInsets.all(AppPadding.p2),
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: AppSize.s8),
            child: getLabelInfoRow("Business Name", "Jawwal"),
          ),
          Container(
            padding: EdgeInsets.all(AppPadding.p2),
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: AppSize.s8),
            child: getLabelInfoRow("Transaction Amount", widget.amount + " ILS"),
          )
        ],
      ),
    );
  }

  Row getLabelInfoRow(String name, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          value,
          style:
              getTextStyle(dTextColor).copyWith(fontWeight: FontWeight.normal),
        ),
        SizedBox(
          width: AppSize.s16,
        ),
        Text(
          name,
          style: getLabelTextStyle().copyWith(fontWeight: FontWeight.normal),
        )
      ],
    );
  }
}
