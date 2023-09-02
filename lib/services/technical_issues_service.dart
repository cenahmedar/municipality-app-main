import 'package:municipality_app/constants/apis.dart';

import 'package:municipality_app/utils/http_utils.dart';

class TechnicalIssuesService {
  late HttpUtil _httpUtil;
  TechnicalIssuesService() {
    _httpUtil = HttpUtil();
  }

  Future<bool> submitTechnicalIssueTicket({
    required double requestId,
    required double typeId,
  }) async {
    try {
      await _httpUtil.makeRequest(
          type: RequestType.post,
          path: Apis.SUBMIT_TECHNICAL_ISSUE_TICKET,
          data: {
            "troubleTicketTypeId": typeId,
            "serviceFormId": requestId,
          });
      return true;
    } catch (exp) {
      print(exp);
      return false;
    }
  }
}
