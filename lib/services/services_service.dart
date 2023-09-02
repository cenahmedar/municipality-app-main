import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:municipality_app/constants/apis.dart';
import 'package:municipality_app/models/service_input.dart';
import 'package:municipality_app/models/service_model.dart';
import 'package:municipality_app/utils/http_utils.dart';

class ServicesService {
  late HttpUtil _httpUtil;
  ServicesService() {
    _httpUtil = HttpUtil();
  }

  Future<List<ServiceModel>?> getServices() async {
    try {
      final List<dynamic> data = await _httpUtil.makeRequest(
          type: RequestType.get, path: Apis.GET_SERVICES);
      return data
          .map<ServiceModel>((json) => ServiceModel.fromJson(json))
          .toList();
    } catch (exp) {
      return null;
    }
  }

  Future<ServiceModel?> getServiceDetails(double id) async {
    try {
      final data = await _httpUtil.makeRequest(
        type: RequestType.get,
        path: 'Service/$id',
      );

      return ServiceModel.fromJson(data);
    } catch (e) {
      return null;
    }
  }

  Future<dynamic> submitRequest(
      double serviceId, Map<double, ServiceInput> inputs) async {
    try {
      List<ServiceInput> inputFields = [];
      List<ServiceInput> inputFieldsAttachments = [];
      Map<String, dynamic> formData = {};
      inputs.forEach((key, value) {
        if (value.attachment != null) {
          inputFieldsAttachments.add(value);
        } else {
          inputFields.add(value);
        }
      });

      inputFieldsAttachments.asMap().forEach((index, value) {
        formData["InputFieldsAttachments[$index].inputFieldId"] =
            value.inputFieldId;
        formData["InputFieldsAttachments[$index].valueString"] =
            value.valueString;
        formData["InputFieldsAttachments[$index].attachment"] =
            value.attachment;
      });
      inputFields.asMap().forEach((index, value) {
        formData["InputFields[$index].inputFieldId"] = value.inputFieldId;
        formData["InputFields[$index].valueString"] = value.valueString;
      });

      formData['ServiceId'] = serviceId;
      FormData dataToSend = FormData.fromMap(formData);

      final data = await _httpUtil.makeRequest(
        type: RequestType.post,
        path: Apis.CREATE_SERVICE_ORDER,
        data: dataToSend,
      );
      return data;
    } catch (e) {
      return null;
    }
  }
}
