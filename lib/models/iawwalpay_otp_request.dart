class JawwalPayOtpRequest {
  JawwalPayOtpRequest({
    this.mobileNo,
    this.amount,
  });

  JawwalPayOtpRequest.fromJson(dynamic json) {
    mobileNo = json['mobileNo'];
    amount = json['amount'];
  }

  String? mobileNo;
  String? amount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mobileNo'] = mobileNo;
    map['amount'] = amount;
    return map;
  }
}
