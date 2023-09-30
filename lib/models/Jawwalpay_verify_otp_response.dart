class JawwalpayVerifyOtpResponse {
  JawwalpayVerifyOtpResponse({
    this.status,
    this.result,
    this.formId,
    this.receiptId,});

  JawwalpayVerifyOtpResponse.fromJson(dynamic json) {
    status = json['status'];
    result = json['result'];
    formId = json['formId'];
    receiptId = json['receiptId'];
  }
  int? status;
  String? result;
  dynamic formId;
  dynamic receiptId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['result'] = result;
    map['formId'] = formId;
    map['receiptId'] = receiptId;
    return map;
  }

}