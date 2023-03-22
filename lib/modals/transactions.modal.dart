import 'package:flutter/foundation.dart';

class Transaction {
  final String id;
  final String name;
  final double amound;
  final DateTime date;

  Transaction({
    @required this.id,
    @required this.name,
    @required this.amound,
    @required this.date,
  });
}
