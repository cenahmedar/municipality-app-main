class JawwalVerifyOtpRequest {
  String? id;
  double? amount;
  String? paymentType;
  String? mobileNo;
  String? otpCode;

  JawwalVerifyOtpRequest({
    this.amount,
    this.otpCode,
    this.mobileNo,
    this.id,
    this.paymentType,
  });

  JawwalVerifyOtpRequest.fromJson(dynamic json) {
    amount = json['amount'];
    otpCode = json['otpCode'];
    mobileNo = json['mobileNo'];
    id = json['id'];
    paymentType = json['paymentType'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['amount'] = amount;
    map['otpCode'] = otpCode;
    map['mobileNo'] = mobileNo;
    map['id'] = id;
    map['paymentType'] = paymentType;
    return map;
  }
}
