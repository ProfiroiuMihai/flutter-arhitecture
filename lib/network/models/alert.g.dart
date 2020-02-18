// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Alert _$AlertFromJson(Map<String, dynamic> json) {
  return Alert(
    status: json['status'] as int,
    body: json['body'] as String,
  );
}

Map<String, dynamic> _$AlertToJson(Alert instance) => <String, dynamic>{
      'status': instance.status,
      'body': instance.body,
    };
