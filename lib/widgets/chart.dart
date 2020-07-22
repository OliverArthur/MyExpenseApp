import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants.dart';

// models
import '../models/transaction.dart';

// widgets
import './chart_bar.dart';

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
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalAmount,
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupTransition.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevationZero,
      child: Padding(
        padding: EdgeInsets.all(paddingL),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupTransition.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                label: data['day'],
                spedingAmount: data['amount'],
                spedingPercentAmount: totalSpending == 0.0
                    ? 0.0
                    : (data['amount'] as double) / totalSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
