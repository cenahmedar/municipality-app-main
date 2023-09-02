import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:municipality_app/utils/json_serializer_utils.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  final String? id;

  @JsonKey(name: 'iUserName')
  final String? username;

  @JsonKey(name: 'UserType', defaultValue: null)
  final String? userType;

  @JsonKey(name: 'isSmsVerify', fromJson: boolFromString)
  final bool isSmsVerify;

  @JsonKey(name: 'isactive', fromJson: boolFromString)
  final bool isActive;

  @JsonKey(name: 'isblocked', fromJson: boolFromString)
  final bool isBlocked;

  @JsonKey(name: 'isaccept', fromJson: boolFromString)
  final bool isAccept;

  @JsonKey(name: 'eFirstName', defaultValue: null)
  final String? eFirstName;

  @JsonKey(name: 'aFirstName', defaultValue: null)
  final String? aFirstName;

  @JsonKey(name: 'eMiddleName', defaultValue: null)
  final String? eMiddleName;
  @JsonKey(name: 'aMiddleName', defaultValue: null)
  final String? aMiddleName;
  @JsonKey(name: 'eFamilyName', defaultValue: null)
  final String? eFamilyName;

  @JsonKey(name: 'aFamilyName', defaultValue: null)
  final String? aFamilyName;
  @JsonKey(name: 'idCarNumber', defaultValue: null)
  final String? idCarNumber;
  @JsonKey(name: 'passportNumber', defaultValue: null)
  final String? passportNumber;
  @JsonKey(name: 'dateOfBirth', defaultValue: null)
  final String? dateOfBirth;
  @JsonKey(name: 'placeOfBirth', defaultValue: null)
  final String? placeOfBirth;
  @JsonKey(name: 'addressLine1', defaultValue: null)
  String? addressLine1;
  @JsonKey(name: 'addressLine2', defaultValue: null)
  final String? addressLine2;

  @JsonKey(name: 'telephone', defaultValue: null)
  final String? telephone;
  @JsonKey(name: 'mobile', defaultValue: null)
  final String? mobile;
  @JsonKey(name: 'profession', defaultValue: null)
  final String? profession;

  @JsonKey(name: 'IsApproved', fromJson: boolFromString)
  final bool isapproved;
  @JsonKey(name: 'aGrandName', defaultValue: null)
  final String? aGrandName;
  @JsonKey(name: 'eGrandName', defaultValue: null)
  final String? eGrandName;
  @JsonKey(name: 'email', defaultValue: null)
  String? email;
  @JsonKey(name: 'financialSystemRefNumber')
  final String? financialSystemRefNumber;
  @JsonKey(name: 'fax')
  final String? fax;
  @JsonKey(name: 'ProfilePicture')
  String? profilePicture;

  User({
    required this.eFirstName,
    required this.aFirstName,
    required this.eMiddleName,
    required this.aMiddleName,
    required this.eFamilyName,
    required this.aFamilyName,
    required this.idCarNumber,
    required this.passportNumber,
    required this.dateOfBirth,
    required this.placeOfBirth,
    required this.addressLine1,
    required this.addressLine2,
    required this.telephone,
    required this.mobile,
    required this.profession,
    required this.isapproved,
    required this.aGrandName,
    required this.eGrandName,
    required this.email,
    required this.financialSystemRefNumber,
    required this.fax,
    required this.id,
    required this.username,
    required this.userType,
    required this.isSmsVerify,
    required this.isAccept,
    required this.isActive,
    required this.isBlocked,
    required this.profilePicture,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
