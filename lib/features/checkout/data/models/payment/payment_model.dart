import 'amount.dart';
import 'item_list.dart';

class PaymentModel {
  final Amount amount;
  final String description;
  final ItemList itemList;

  PaymentModel(
      {required this.amount,
      required this.description,
      required this.itemList});

  factory PaymentModel.fromJson(Map<String, dynamic> json) => PaymentModel(
        amount: Amount.fromJson(json['amount'] as Map<String, dynamic>),
        description: json['description'] as String,
        itemList: ItemList.fromJson(json['item_list'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'amount': amount.toJson(),
        'description': description,
        'item_list': itemList.toJson(),
      };
}
