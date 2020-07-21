import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// models
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  // properties
  final List<Transaction> recentTransactions;

  // constructor
  Chart({this.recentTransactions});

  List<Map<String, Object>> get groupTransition {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(
          days: index,
        ),
      );
      var totalAmount = 0.0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].created.day == weekDay.day &&
            recentTransactions[i].created.month == weekDay.month &&
            recentTransactions[i].created.year == weekDay.year) {
          totalAmount += recentTransactions[i].amount;
        }
      }
      print(DateFormat.E().format(weekDay));
      print(totalAmount);
      return {
        'day': DateFormat.E().format(weekDay),
        'amount': totalAmount,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupTransition);
    return Container(
      child: Card(
        elevation: 5,
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[],
            )
          ],
        ),
      ),
    );
  }
}
