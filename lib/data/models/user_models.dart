import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';


part 'user_models.g.dart';


@JsonSerializable()
class UserModelsData extends Equatable {
  @JsonKey(name: "user_id")
  final int? userId;
  @JsonKey(name: "first_name")
  final String? firstName;
  @JsonKey(name: "last_name")
  final String? lastName;
  @JsonKey(name: "full_name")
  final String? fullName;
  @JsonKey(name: "gender")
  final String? gender;
  @JsonKey(name: "age")
  final int? age;

  UserModelsData({
    this.userId,
    this.firstName,
    this.lastName,
    this.fullName,
    this.gender,
    this.age,
  });

  factory UserModelsData.fromJson(Map<String, dynamic> json) =>
      _$UserModelsDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelsDataToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        userId,
        firstName,
        lastName,
        fullName,
        gender,
        age,
      ];
}
