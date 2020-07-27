import 'package:flutter/material.dart';

// constant
import '../constants.dart';

class TransactionAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(100);

  // propeties
  final MediaQueryData mediaQuery;

  // constructor
  TransactionAppBar({this.mediaQuery});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ligthBackgroundColor,
      title: Text(
        'Personal Expenses',
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          color: textPrimaryColor,
          iconSize: 32,
          onPressed: () => {},
        ),
      ],
    );
  }
}
