import 'package:flutter/material.dart';
import 'package:municipality_app/models/lookup_data_model.dart';
import 'package:municipality_app/models/service_field_model.dart';

class ServiceDropdownField extends StatelessWidget {
  final ServiceFieldModel field;
  final String? value;
  final Function onChange;
  final Map<double, dynamic> inputs;
  const ServiceDropdownField({
    Key? key,
    required this.field,
    required this.onChange,
    required this.inputs,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<LookupDataModel>? lookupData = field.lookupData;
    if (field.cascadeField != null) {
      lookupData = lookupData
          ?.where((element) =>
              element.cascade == inputs[field.cascadeField]?.valueString)
          .toList();
    }

    return Card(
      child: Container(
          margin: EdgeInsets.only(right: 16, left: 16, top: 5, bottom: 5),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              field.getName(context) +
                                  (field.requiredField ? '*' : ''),
                              style: TextStyle(
                                  color: const Color(0xffa9acaf),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              value ?? '',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Cairo",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 13.0),
                              textAlign: TextAlign.start,
                            )
                          ],
                        ),
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Color(0xffa5a3a9),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: double.infinity,
                  child: DropdownButton<String>(
                      underline: Container(),
                      items: lookupData?.map((LookupDataModel value) {
                        return DropdownMenuItem<String>(
                          value: value.code ?? value.getName(context),
                          child: Text(
                            value.getName(context),
                          ),
                        );
                      }).toList(),
                      onChanged: (newValue) =>
                          onChange(key: field.fieldReference, value: newValue),
                      icon: Container()),
                ),
              ),
            ],
          )),
    );
  }
}
