import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/network/models/transaction.dart';
import 'package:flutter_template/network/response/dashboard_response.dart';
import 'package:flutter_template/screens/dashboard/transactions/transaction_item.dart';
import 'package:flutter_template/util/scale_ui_utils.dart';
import 'package:flutter_template/widgets/text_widget.dart';
import '../../../router.dart';

class Transactions extends StatefulWidget {

  DashboardResponse response;


  Transactions(this.response);

  @override
  TransactionsState createState() => TransactionsState(response);
}

class TransactionsState extends State<Transactions> {
  DashboardResponse response;
  TransactionsState(this.response);

  List<TransactionItem> _transactions = <TransactionItem>[];
  var items = <ListItem>[];

  @override
  Widget build(BuildContext context) {
    createMockupList();

    return new SizedBox(
      height: ScreenUtil().setHeight(331),
      child: _transactionsList(),
    );
  }

  Widget _transactionsList() {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, i) {
        final index = i ~/ 2;
        if (index >= items.length / 2) {
          createMockupList();
        }
        return items[i] is Month
            ? _buildTransactionsLabel(items[i] as Month)
            : _buildTransactionsRow(items[i]);
      },
    );
  }

  Widget _buildTransactionsLabel(Month month) {
    return ListTile(
        contentPadding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(16),
            vertical: ScreenUtil().setHeight(0)),
        title: TextWidget(month.monthLabel,
            fontWeight: FontWeight.w600, fontSize: 15));
  }

  Widget _buildTransactionsRow(TransactionItem transaction) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(16),
          vertical: ScreenUtil().setHeight(0)),
      leading: CircleAvatar(
        radius: 17.5,
        backgroundImage: NetworkImage(transaction.imageURL),
      ),
      title: TextWidget(
        transaction.merchant,
        fontWeight: FontWeight.w600,
        fontSize: 15,
      ),
      subtitle: TextWidget(transaction.time,
          fontWeight: FontWeight.w600,
          fontSize: 13,
          color: Color.fromARGB(255, 195, 203, 210)),
      trailing: amount(transaction.amount),
      onTap: () {
//        Router.showTransactionDetailsScreen(context, transaction);
      },
    );
  }

  Widget amount(String amount) => new SizedBox(
      height: ScreenUtil().setHeight(55),
      width: ScreenUtil().setHeight(150),
      child: new Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[TextWidget(amount, fontSize: 14,fontWeight: FontWeight.w600)]));

  void createMockupList() {
    this.response.trans.forEach((t) => {
          _transactions.add(TransactionItem(
              Transaction.fromJson(t).name,
              Transaction.fromJson(t).subtitle,
              Transaction.fromJson(t).icon,
              r"$" + Transaction.fromJson(t).amount,
              Transaction.fromJson(t).timeSection,
              Transaction.fromJson(t).merchantCateg,
              Transaction.fromJson(t).phone,
              Transaction.fromJson(t).website,
              Transaction.fromJson(t).address))
        });

    createFinalTransactionList();
  }

  void createFinalTransactionList() {
    int index = 0;
    _transactions.forEach((transaction) => {
          index = _transactions.indexOf(transaction),
          if (index == 0)
            {items.add(Month(transaction.date)), items.add(transaction)}
          else
            {
              if (_transactions[index - 1].date != transaction.date)
                {items.add(Month(transaction.date)), items.add(transaction)}
              else
                {items.add(transaction)}
            }
        });
  }
}
