import 'package:dio/dio.dart';
import 'package:municipality_app/constants/apis.dart';
import 'package:municipality_app/models/suggestion_or_complaint_model.dart';
import 'package:municipality_app/utils/http_utils.dart';

class SuggestionsComplaintsService {
  late HttpUtil _httpUtil;
  SuggestionsComplaintsService() {
    _httpUtil = HttpUtil();
  }

  Future<SuggestionOrComplaint?> submitSuggestionOrComplaint(
      Map<String, dynamic> values) async {
    try {
      FormData _formData = FormData.fromMap(values);
      dynamic response = await _httpUtil.makeRequest(
        type: RequestType.post,
        path: Apis.SUBMIT_SUGGESTION_OR_COMPLAINT,
        data: _formData,
      );
      return SuggestionOrComplaint.fromJson(response);
    } catch (exp) {
      return null;
    }
  }

  Future<dynamic> submitQuestionOrRequest(Map<String, dynamic> values) async {
    try {
      FormData _formData = FormData.fromMap(values);
      dynamic response = await _httpUtil.makeRequest(
        type: RequestType.post,
        path: Apis.SUBMIT_QUESTION_OR_REQUEST,
        data: _formData,
      );
      return response;
    } catch (exp) {
      return null;
    }
  }
}
