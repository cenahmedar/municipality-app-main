import 'package:municipality_app/constants/apis.dart';

import 'package:municipality_app/utils/http_utils.dart';

class JawwalPayService {
  late HttpUtil _httpUtil;
  JawwalPayService() {
    _httpUtil = HttpUtil();
  }

  Future<String?> payBill({
    required String amount,
    required String billId,
  }) async {
    try {
      final dynamic data = await _httpUtil.makeRequest(
        path: Apis.PAY_BILL,
        type: RequestType.post,
        data: {
          "amount": amount,
          "payForId": billId,
        },
      );
      return data['paymentKey'];
    } catch (exp) {
      return null;
    }
  }

  Future<String?> payTax({
    required String amount,
    required String taxId,
  }) async {
    try {
      final dynamic data = await _httpUtil.makeRequest(
        path: Apis.PAY_TAX,
        type: RequestType.post,
        data: {
          "amount": amount,
          "payForId": taxId,
        },
      );
      return data['paymentKey'];
    } catch (exp) {
      return null;
    }
  }
}
