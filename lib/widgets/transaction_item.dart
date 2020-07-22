import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// constants
import '../constants.dart';

// models
import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteItem,
    @required this.mediaQuery,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteItem;
  final MediaQueryData mediaQuery;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mediaQuery.size.width,
      padding: EdgeInsets.symmetric(
        vertical: paddingS,
        horizontal: paddingM,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: paddingS,
          right: paddingS,
        ),
        child: Card(
          elevation: 0,
          margin: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: Padding(
                padding: EdgeInsets.all(
                  paddingM,
                ),
                child: FittedBox(
                  child: Text(
                    '€${transaction.amount}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: fontSizeXL,
                    ),
                  ),
                ),
              ),
            ),
            title: Text(
              transaction.title,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: fontSizeM,
                color: textPrimaryColor,
              ),
            ),
            subtitle: Text(
              DateFormat.yMMMMEEEEd().format(transaction.created),
              style: TextStyle(
                fontSize: fontSizeS,
                fontWeight: FontWeight.bold,
                color: textSecondaryColor,
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              color: Theme.of(context).errorColor,
              onPressed: () => deleteItem(transaction.id),
            ),
          ),
        ),
      ),
    );
  }
}
