import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../config.dart';
import '../models/models.dart';

class TransactionApiClient {
  final http.Client httpClient;

  TransactionApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);

  Future<Transaction> getTransactions() async {
    final endpoint = '${Config.baseURI}/transactions';
    final response = await this.httpClient.get(endpoint);

    if (response.statusCode == 200) {
      final payload = json.decode(response.body);
      Transaction transactions = Transaction.fromJson(payload);
      return transactions;
    } else {
      throw Exception('They was an error loading the transaction.');
    }
  }
}
