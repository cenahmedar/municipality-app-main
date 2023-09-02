import 'package:municipality_app/constants/apis.dart';
import 'package:municipality_app/models/faq.dart';

import 'package:municipality_app/utils/http_utils.dart';

class FAQService {
  late HttpUtil _httpUtil;
  FAQService() {
    _httpUtil = HttpUtil();
  }

  Future<List<FAQ>?> getFAQList() async {
    try {
      final List<dynamic> data = await _httpUtil.makeRequest(
          type: RequestType.get, path: Apis.GET_FAQ_LIST);
      return data.map<FAQ>((json) => FAQ.fromJson(json)).toList();
    } catch (exp) {
      return null;
    }
  }
}
