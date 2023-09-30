import 'package:municipality_app/constants/apis.dart';

import 'package:municipality_app/utils/http_utils.dart';

import '../models/Jawwalpay_verify_otp_response.dart';
import '../models/iawwalpay_otp_request.dart';
import '../models/jawwalpay_otp_response.dart';
import '../models/jawwalpay_verify_otp_request.dart';
import '../utils/logs.dart';

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

  Future<JawwalPayOtpResponse?> getJawwalPayOtp(
      JawwalPayOtpRequest requestData) async {
    print("Request Model Jawwal ${requestData.mobileNo}");
    try {
      final data = await _httpUtil.makeRequest(
          type: RequestType.post,
          path: '/JawwalPayPOS/SendOTPForServiceAndTaxes',
          data: requestData.toJson());

      final jawwalOtpResponse = JawwalPayOtpResponse.fromJson(data);
      printLog("Response Model Jawwal $data");
      return jawwalOtpResponse;
    } catch (e) {
      return null;
    }
  }

  Future<JawwalpayVerifyOtpResponse?> verifyJawwalPayOtp(
      JawwalVerifyOtpRequest requestData) async {
    try {
      final data = await _httpUtil.makeRequest(
          type: RequestType.post,
          path: '/JawwalPayPOS/MFP',
          data: requestData.toJson());
      final jawwalOtpResponse = JawwalpayVerifyOtpResponse.fromJson(data);
      printLog("Response Model Jawwal $data");
      return jawwalOtpResponse;
    } catch (e) {
      return null;
    }
  }
}
