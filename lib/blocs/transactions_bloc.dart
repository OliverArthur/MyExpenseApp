import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import '../repositories/repositories.dart';
import '../models/models.dart';
import './blocs.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final TransactionRepository transactionRepository;

  TransactionBloc({@required this.transactionRepository})
      : assert(transactionRepository != null),
        super(TransactionInitial());

  @override
  Stream<TransactionState> mapEventToState(TransactionEvent event) async* {
    if (event is TransactionRequested) {
      yield TransactionLoadInProgress();
      try {
        final Transaction transaction =
            await transactionRepository.fetchTransaction();
        yield TransactionLoadSuccess(transaction: transaction);
      } catch (_) {
        yield TransactionLoadFailure();
      }
    }
  }
}
