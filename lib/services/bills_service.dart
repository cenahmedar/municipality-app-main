import 'package:municipality_app/constants/apis.dart';
import 'package:municipality_app/models/bill.dart';
import 'package:municipality_app/models/tax.dart';

import 'package:municipality_app/utils/http_utils.dart';

class BillsService {
  late HttpUtil _httpUtil;
  BillsService() {
    _httpUtil = HttpUtil();
  }

  Future<List<Bill>?> getBills() async {
    try {
      final List<dynamic> data =
          await _httpUtil.makeRequest(path: Apis.GET_ALL_BILLS);
      return data.map<Bill>((json) => Bill.fromJson(json)).toList();
    } catch (exp) {
      return null;
    }
  }

  Future<List<Tax>?> getTaxes() async {
    try {
      final List<dynamic> data =
          await _httpUtil.makeRequest(path: Apis.GET_ALL_TAXES);
      return data.map<Tax>((json) => Tax.fromJson(json)).toList();
    } catch (exp) {
      return null;
    }
  }

  Future<bool?> checkIfInvoiceIsPaid(String invoiceNo) async {
    try {
      final List<dynamic> data =
          await _httpUtil.makeRequest(path: "BillsAndTaxes/Bills/$invoiceNo");
      return data.length == 0;
    } catch (exp) {
      return null;
    }
  }

  Future<bool?> checkIfTaxIsPaid(String ptId) async {
    try {
      final List<dynamic> data =
          await _httpUtil.makeRequest(path: "BillsAndTaxes/Taxes/$ptId");
      return data.length == 0;
    } catch (exp) {
      return null;
    }
  }
}
