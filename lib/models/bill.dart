import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:municipality_app/utils/json_serializer_utils.dart';
part 'bill.g.dart';

@JsonSerializable()
class Bill {
  @JsonKey(name: 'invoiceAmount', fromJson: stringToDouble)
  final double invoiceAmount;

  @JsonKey(name: 'lateFees', fromJson: stringToDouble)
  final double? lateFees;

  @JsonKey(name: 'invoiceNo')
  final String? invoiceNo;

  @JsonKey(name: 'invoiceDate')
  final String? invoiceDate;

  Bill({
    required this.invoiceAmount,
    required this.lateFees,
    this.invoiceNo,
    this.invoiceDate,
  });

  static double stringToDouble(dynamic value) =>
      value != null && value.toString().trim() != ''
          ? double.parse(value.toString())
          : 0;

  factory Bill.fromJson(Map<String, dynamic> json) => _$BillFromJson(json);

  Map<String, dynamic> toJson() => _$BillToJson(this);
}
