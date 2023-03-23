import 'package:flutter/material.dart';

import '../modals/transactions.modal.dart';
import './newTransaction.widget.dart';
import './transactionList.widget.dart';

class UserTransactions extends StatefulWidget {
  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      name: 'new Kit',
      amount: 420.69,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      name: 'new shit',
      amount: 77.69,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(Transaction newTx) {
    setState(() {
      _userTransactions.add(
        Transaction(
          id: newTx.id,
          name: newTx.name,
          amount: newTx.amount,
          date: newTx.date,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(onAddNewTransaction: _addNewTransaction),
        TransactionList(
          transactions: _userTransactions,
        ),
      ],
    );
  }
}
