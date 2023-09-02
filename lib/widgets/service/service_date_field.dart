import 'package:flutter/material.dart';
import 'package:municipality_app/generated/i18n.dart';

import 'package:municipality_app/models/service_field_model.dart';
import 'package:municipality_app/utils/date_time_utils.dart';
import 'package:municipality_app/utils/dialogs.dart';

class ServiceDateField extends StatelessWidget {
  final ServiceFieldModel field;
  final DateTime? value;
  final Function onChange;
  const ServiceDateField({
    Key? key,
    required this.field,
    required this.onChange,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => CustomDialog.showDateDialog(
        context: context,
        title: field.getName(context) + (field.requiredField ? '*' : ''),
        onSelectDate: (date) => onChange(
          key: field.fieldReference,
          value: date,
        ),
      ),
      child: Card(
        child: Container(
          margin: EdgeInsets.only(right: 16, left: 16, top: 14, bottom: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                field.getName(context),
              ),
              Text(value != null
                  ? DateTimeUtils.getDate(value!)
                  : I18n.of(context)!.not_selected)
            ],
          ),
        ),
      ),
    );
  }
}
