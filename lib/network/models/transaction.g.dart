// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return Transaction(
    smallAmount: json['smallAmount'] as String,
    name: json['name'] as String,
    subtitle: json['subtitle'] as String,
    icon: json['icon'] as String,
    amount: json['amount'] as String,
    timeSection: json['timeSection'] as String,
    merchantCateg: json['merchantCateg'] as String,
    phone: json['phone'] as String,
    website: json['website'] as String,
    address: json['address'] as String,
  );
}

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'name': instance.name,
      'subtitle': instance.subtitle,
      'amount': instance.amount,
      'timeSection': instance.timeSection,
      'smallAmount': instance.smallAmount,
      'icon': instance.icon,
      'address': instance.address,
      'phone': instance.phone,
      'website': instance.website,
      'merchantCateg': instance.merchantCateg,
    };
