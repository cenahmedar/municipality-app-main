import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
part 'tax.g.dart';

@JsonSerializable()
class Tax {
  @JsonKey(name: 'taxAmount', fromJson: stringToDouble)
  final double taxAmount;

  @JsonKey(name: 'taxName')
  final String taxName;

  @JsonKey(name: 'serviceNo')
  final String serviceNo;

  @JsonKey(name: 'ptid')
  final String ptid;

  @JsonKey(name: 'taxDate', fromJson: stringToDate)
  final DateTime? taxDate;

  Tax({
    required this.taxAmount,
    required this.taxName,
    required this.ptid,
    required this.serviceNo,
    this.taxDate,
  });

  static double stringToDouble(dynamic value) => double.parse(value.toString());
  static DateTime stringToDate(dynamic value) =>
      DateFormat('mm-dd-yyyy').parse(value);

  factory Tax.fromJson(Map<String, dynamic> json) => _$TaxFromJson(json);

  Map<String, dynamic> toJson() => _$TaxToJson(this);
}
