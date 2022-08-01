// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usermodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      page: json['page'] as int? ?? 0,
      per_page: json['per_page'] as int? ?? 0,
      total: json['total'] as int? ?? 0,
      total_pages: json['total_pages'] as int? ?? 0,
      data: (json['data'] as List<dynamic>)
          .map((e) => Datas.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'page': instance.page,
      'per_page': instance.per_page,
      'total': instance.total,
      'total_pages': instance.total_pages,
      'data': instance.data,
    };

Datas _$DatasFromJson(Map<String, dynamic> json) => Datas(
      id: json['id'] as int? ?? 0,
      email: json['email'] as String? ?? "",
      first_name: json['first_name'] as String? ?? "",
      last_name: json['last_name'] as String? ?? "",
      avatar: json['avatar'] as String? ?? "",
    );

Map<String, dynamic> _$DatasToJson(Datas instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'avatar': instance.avatar,
    };
