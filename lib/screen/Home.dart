import 'package:flutter/material.dart';
import 'package:my_expenses/widgets/chart.dart';

// constants
import '../constants.dart';

// models
import '../models/transaction.dart';

// widgets
import '../widgets/transaction_list.dart';
import '../widgets/add_transaction.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // propeties
  final List<Transaction> _userTransactions = [];
  List<Transaction> get _recentTransaction {
    return _userTransactions.where((element) {
      return element.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  /// private method to add new transaction by passing the parameters
  /// [title], [amount].
  void _createNewTransaction(String title, double amount, DateTime chosenDate) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: chosenDate,
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((item) => item.id == id);
    });
  }

  void _openModalTransactions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return GestureDetector(
          onTap: () {},
          child: AddTransaction(
            createTx: _createNewTransaction,
          ),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  Widget _buildChart(MediaQueryData mediaQuery, AppBar appBar) {
    return Container(
      height: (mediaQuery.size.height -
              appBar.preferredSize.height -
              mediaQuery.padding.top) *
          0.24,
      width: mediaQuery.size.width,
      child: Chart(
        recentTransactions: _recentTransaction,
      ),
    );
  }

  Widget _buildTransactions(MediaQueryData mediaQuery, AppBar appBar) {
    return Container(
      height: (mediaQuery.size.height -
              appBar.preferredSize.height -
              mediaQuery.padding.top) *
          0.7,
      child: TransactionList(
        transactions: _userTransactions,
        deleteItem: _deleteTransaction,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final appBar = AppBar(
      backgroundColor: ligthBackgroundColor,
      title: Text(
        'Personal Expenses',
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          color: textPrimaryColor,
          iconSize: 32,
          onPressed: () => _openModalTransactions(context),
        ),
      ],
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: ligthBackgroundColor,
        appBar: appBar,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                width: double.infinity,
                child: _userTransactions.isEmpty
                    ? null
                    : _buildChart(mediaQuery, appBar),
              ),
              _buildTransactions(mediaQuery, appBar),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _openModalTransactions(context),
        ),
      ),
    );
  }
}
