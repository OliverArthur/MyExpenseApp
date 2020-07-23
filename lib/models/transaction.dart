import 'package:equatable/equatable.dart';

class Transaction extends Equatable {
  // properties
  final String id;
  final String title;
  final DateTime createdAt;
  final double amount;
  final String note;
  final String file;
  final DateTime date;

  // constructor
  Transaction({
    this.id,
    this.title,
    this.createdAt,
    this.amount,
    this.note,
    this.file,
    this.date,
  });

  @override
  List<Object> get props => [
        id,
        title,
        createdAt,
        amount,
        note,
        file,
        date,
      ];

  static Transaction fromJson(dynamic json) {
    return Transaction(
      id: json['id'],
      title: json['title'],
      createdAt: json['createdAt'],
      amount: json['amount'] as double,
      note: json['note'],
      file: json['file'],
      date: json['date'],
    );
  }
}
