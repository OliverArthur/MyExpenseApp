import 'package:flutter/material.dart';

import '../constants.dart';

class TotalSpeding extends StatelessWidget {
  final double total;

  TotalSpeding({this.total});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: paddingXL),
          child: Text(
            'Total spent',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: paddingM),
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(
              '€${total.toString()}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 48,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
