import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class DashboardResponse {
  List<dynamic> alerts;
  List<dynamic> trans;
  double availableFunds;
  double totalFunds;
  String text1;
  String text2;
  String rubyTitle;
  String rubySubtitle;

  DashboardResponse(
      {this.alerts,
      this.trans,
      this.availableFunds,
      this.totalFunds,
      this.text1,
      this.text2,
      this.rubyTitle,
      this.rubySubtitle});

  factory DashboardResponse.fromJson(Map<String, dynamic> json) =>
      DashboardResponse(
        alerts: json['alerts'] as List,
        trans: json['trans'] as List,
        availableFunds: (json['availableFunds'] as num)?.toDouble(),
        totalFunds: (json['totalFunds'] as num)?.toDouble(),
        text1: json['text1'] as String,
        text2: json['text2'] as String,
        rubyTitle: json['rubyTitle'] as String,
        rubySubtitle: json['rubySubtitle'] as String,
      );

  Map<String, dynamic> toJson() => _$DashboardResponseToJson(this);

  Map<String, dynamic> _$DashboardResponseToJson(DashboardResponse instance) =>
      <String, dynamic>{
        'alerts': instance.alerts,
        'trans': instance.trans,
        'availableFunds': instance.availableFunds,
        'totalFunds': instance.totalFunds,
        'text1': instance.text1,
        'text2': instance.text2,
        'rubyTitle': instance.rubyTitle,
        'rubySubtitle': instance.rubySubtitle,
      };
}
