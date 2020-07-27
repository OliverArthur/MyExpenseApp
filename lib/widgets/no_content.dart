import 'package:flutter/material.dart';

import '../constants.dart';

class NotContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
