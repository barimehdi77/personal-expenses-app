import 'package:flutter/material.dart';

import './widgets/newTransaction.widget.dart';
import './widgets/transactionList.widget.dart';
import './modals/transactions.modal.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(onAddNewTransaction: _addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
        actions: [
          IconButton(
              onPressed: () {
                _startAddNewTransaction(context);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: Card(
                  child: Text('this is a Card!'),
                  color: Colors.blue,
                  elevation: 5,
                ),
              ),
              NewTransaction(onAddNewTransaction: _addNewTransaction),
              TransactionList(
                transactions: _userTransactions,
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _startAddNewTransaction(context);
        },
      ),
    );
  }
}
