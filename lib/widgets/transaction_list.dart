import 'package:flutter/material.dart';
import 'package:my_expenses/constants.dart';

// models
import '../models/transaction.dart';

// widgets
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteItem;

  TransactionList({this.transactions, this.deleteItem});

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 24),
                width: 200,
                child: Text(
                  'No transactions has been added yet',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              SizedBox(
                height: spaceXL,
              ),
              Container(
                height: 200,
                child: Image.asset(
                  'assets/images/empty.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return TransactionItem(
                transaction: transactions[index],
                deleteItem: deleteItem,
              );
            },
            itemCount: transactions.length,
          );
  }
}
