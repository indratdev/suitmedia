import 'package:json_annotation/json_annotation.dart';

part 'usermodel.g.dart';

@JsonSerializable()
class UserModel {
  int page, per_page, total, total_pages;
  List<Datas> data;

  UserModel({
    this.page = 0,
    this.per_page = 0,
    this.total = 0,
    this.total_pages = 0,
    required this.data,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable()
class Datas {
  int id;
  String email, first_name, last_name, avatar;

  Datas({
    this.id = 0,
    this.email = "",
    this.first_name = "",
    this.last_name = "",
    this.avatar = "",
  });

  factory Datas.fromJson(Map<String, dynamic> json) => _$DatasFromJson(json);

  Map<String, dynamic> toJson() => _$DatasToJson(this);
}
