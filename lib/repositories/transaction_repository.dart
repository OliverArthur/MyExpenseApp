import 'dart:async';
import 'package:meta/meta.dart';

import 'package:my_expenses/repositories/transaction_api_client.dart';
import 'package:my_expenses/models/models.dart';

class TransactionRepository {
  final TransactionApiClient transactionApiClient;

  TransactionRepository({
    @required this.transactionApiClient,
  }) : assert(transactionApiClient != null);

  Future<Transaction> fetchTransaction() async {
    return transactionApiClient.getTransactions();
  }
}
