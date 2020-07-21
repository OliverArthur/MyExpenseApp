import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  //  properties
  final String label;
  final double spedingAmount;
  final double spedingPercentAmount;

  // constructor
  ChartBar({this.label, this.spedingAmount, this.spedingPercentAmount});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FittedBox(
          child: Text('\$${spedingAmount.toStringAsFixed(0)}'),
        ),
        SizedBox(height: 10),
        Container(
            height: 60,
            width: 10,
            child: Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: spedingPercentAmount,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )
                ],
              ),
            )),
        SizedBox(height: 10),
        Text(label),
      ],
    );
  }
}
