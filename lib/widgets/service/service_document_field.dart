import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:municipality_app/generated/i18n.dart';
import 'package:municipality_app/models/service_field_model.dart';

class ServiceDocumentField extends StatelessWidget {
  final ServiceFieldModel field;
  final Function onChange;
  final dynamic value;
  const ServiceDocumentField({
    Key? key,
    required this.field,
    required this.onChange,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ImagePicker _picker = ImagePicker();

    return GestureDetector(
      onTap: () async {
        try {
          final XFile? selectedImage =
              await _picker.pickImage(source: ImageSource.gallery);

          onChange(
            key: field.fieldReference,
            value: selectedImage?.name,
            attachment: await MultipartFile.fromFile(
              selectedImage?.path ?? '',
              filename: selectedImage?.name,
            ),
          );
        } catch (e) {}
      },
      child: Card(
        child: Container(
          margin: EdgeInsets.only(right: 16, left: 16, top: 14, bottom: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  field.getName(context) + (field.requiredField ? '*' : ''),
                  maxLines: 2,
                  style: const TextStyle(
                    color: const Color(0xff787878),
                    fontWeight: FontWeight.w400,
                    fontFamily: "Cairo",
                    fontStyle: FontStyle.normal,
                    fontSize: 13.0,
                  ),
                ),
              ),
              SizedBox(width: 5),
              Container(
                height: 28,
                width: 70,
                decoration: BoxDecoration(
                    color: value != null
                        ? Colors.white
                        : Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                    )),
                child: Center(
                  child: Text(
                    value != null
                        ? I18n.of(context)!.file_attached
                        : I18n.of(context)!.attach_file,
                    style: TextStyle(
                      color: value != null
                          ? Theme.of(context).primaryColor
                          : Colors.white,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Cairo",
                      fontStyle: FontStyle.normal,
                      fontSize: 13.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
