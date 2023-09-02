import 'package:json_annotation/json_annotation.dart';

part 'user_credentials.g.dart';

@JsonSerializable()
class UserCredentials {
  @JsonKey(name: 'idNumber')
  final String username;
  @JsonKey(name: 'password')
  final String password;

  UserCredentials(this.username, this.password);

  factory UserCredentials.fromJson(Map<String, dynamic> json) => _$UserCredentialsFromJson(json);

  Map<String, dynamic> toJson() => _$UserCredentialsToJson(this);
}
