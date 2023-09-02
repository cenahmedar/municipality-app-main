import 'package:municipality_app/constants/apis.dart';

import 'package:municipality_app/models/request.dart';
import 'package:municipality_app/utils/http_utils.dart';

class RequestsService {
  late HttpUtil _httpUtil;
  RequestsService() {
    _httpUtil = HttpUtil();
  }

  Future<List<Request>?> getOrders() async {
    try {
      final List<dynamic> data = await _httpUtil.makeRequest(
          type: RequestType.get, path: Apis.GET_SERVICE_ORDER);
      return data.map<Request>((json) => Request.fromJson(json)).toList();
    } catch (exp) {
      return null;
    }
  }
}
