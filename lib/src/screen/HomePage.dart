import 'package:flutter/material.dart';

// models
import '../models/transaction.dart';

// widgets
import '../widgets/transaction_list.dart';
import '../widgets/add_transaction.dart';
import '../widgets/chart.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // propeties
  final List<Transaction> _userTransactions = [];

  List<Transaction> get _recentTransaction {
    return _userTransactions.where((element) {
      return element.created.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  /// private method to add new transaction by passing the parameters
  /// [title], [amount].
  void _createNewTransaction(String title, double amount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      created: DateTime.now(),
    );

    setState(() {
      _userTransactions.add(newTx);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          'Personal Expenses',
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            color: Colors.black87,
            iconSize: 32,
            onPressed: () => _openModalTransactions(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 15,
              ),
              child: _userTransactions.isEmpty
                  ? null
                  : Card(
                      child: Container(
                        child: Chart(
                          recentTransactions: _recentTransaction,
                        ),
                      ),
                    ),
            ),
            TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openModalTransactions(context),
      ),
    );
  }
}
