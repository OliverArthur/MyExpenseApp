import 'package:flutter/material.dart';

import '../constants.dart';
import './chart_bar.dart';

class ChartBody extends StatelessWidget {
  const ChartBody({
    Key key,
    @required this.groupTransition,
    @required this.totalSpending,
  }) : super(key: key);

  final List<Map<String, Object>> groupTransition;
  final double totalSpending;

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
