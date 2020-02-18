import 'package:json_annotation/json_annotation.dart';

part 'alert.g.dart';

@JsonSerializable()
class Alert{

  int status;
  String body;

  Alert({this.status, this.body});

  factory Alert.fromJson(Map<String, dynamic> json) => _$AlertFromJson(json);
  Map<String, dynamic> toJson() => _$AlertToJson(this);
}