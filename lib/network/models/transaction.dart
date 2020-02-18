import 'package:json_annotation/json_annotation.dart';

part 'transaction.g.dart';

@JsonSerializable()
class Transaction {
  final String name;
  final String subtitle;
  final String amount;
  final String timeSection;
  final String smallAmount;
  final String icon;
  final String address;
  final String phone;
  final String website;
  final String merchantCateg;

  Transaction(
      {this.smallAmount,
      this.name,
      this.subtitle,
      this.icon,
      this.amount,
      this.timeSection,
      this.merchantCateg,
      this.phone,
      this.website,
      this.address});

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}
