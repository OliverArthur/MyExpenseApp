import 'package:equatable/equatable.dart';

abstract class TransactionEvent extends Equatable {
  const TransactionEvent();
}

class TransactionRequested extends TransactionEvent {
  @override
  List<Object> get props => [];
}
