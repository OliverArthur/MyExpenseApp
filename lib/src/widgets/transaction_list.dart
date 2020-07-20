import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// models
import '../models/transaction.dart';
// widgets
import 'transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 24),
                  width: 200,
                  child: Text(
                    'No transactions has been added yet',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/empty.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 15,
                  ),
                  child: TransactionItem(
                    title: transactions[index].title,
                    amount: transactions[index].amount,
                    created: DateFormat.yMMMMEEEEd()
                        .format(transactions[index].created),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
