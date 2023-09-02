import 'package:flutter/material.dart';
import 'package:municipality_app/models/service_field_model.dart';

class ServiceCheckBoxField extends StatelessWidget {
  final ServiceFieldModel field;
  final Function onChange;
  final bool? value;
  const ServiceCheckBoxField({
    Key? key,
    required this.field,
    required this.onChange,
    required this.value,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.only(right: 16, left: 16, top: 14, bottom: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              field.getName(context) + (field.requiredField ? '*' : ''),
              maxLines: 2,
              style: const TextStyle(
                  color: const Color(0xff787878),
                  fontWeight: FontWeight.w400,
                  fontFamily: "Cairo",
                  fontStyle: FontStyle.normal,
                  fontSize: 13.0),
            ),
            Checkbox(
              value: value ?? false,
              onChanged: (bool? value) => onChange(
                key: field.fieldReference,
                value: value,
              ),
            )
          ],
        ),
      ),
    );
  }
}
