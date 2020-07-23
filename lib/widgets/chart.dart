import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// models
import '../models/transaction.dart';

// widgets
import './total_speding.dart';

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
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
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
    return TotalSpeding(
      total: totalSpending,
    );
  }
}
