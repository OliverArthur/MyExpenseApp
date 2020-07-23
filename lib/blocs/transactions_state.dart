import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import '../models/models.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();

  @override
  List<Object> get props => [];
}

class TransactionInitial extends TransactionState {}

class TransactionLoadInProgress extends TransactionState {}

class TransactionLoadSuccess extends TransactionState {
  final Transaction transaction;

  const TransactionLoadSuccess({@required this.transaction})
      : assert(transaction != null);

  @override
  List<Object> get props => [transaction];
}

class TransactionLoadFailure extends TransactionState {}
