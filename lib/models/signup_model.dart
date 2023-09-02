import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'signup_model.g.dart';

@JsonSerializable()
class SignUpModel extends Equatable {
  final String userName;

  final String idNumber;

  @JsonKey(name: "mobileNumber")
  final String phone;

  final String password;

  @JsonKey(name: "confirmPassword")
  final String confirmPassword;

  SignUpModel(this.userName, this.idNumber, this.phone, this.password,
      this.confirmPassword);

  factory SignUpModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpModelFromJson(json);

  @override
  List<Object?> get props => [
        this.userName,
        this.idNumber,
        this.phone,
        this.password,
        this.confirmPassword
      ];

  Map<String, dynamic> toJson() => _$SignUpModelToJson(this);
}
