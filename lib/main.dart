import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
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

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Container(
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
            Card(
              elevation: 7,
              child: Container(
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      decoration:
                          InputDecoration(labelText: 'Transaction Name: '),
                    ),
                    TextField(
                      decoration:
                          InputDecoration(labelText: 'Transaction Amount: '),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('add Transaction'),
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all(Colors.blue)),
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: transactions.map((tx) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blue,
                            width: 2,
                          ),
                        ),
                        child: Text(
                          '\$${tx.amount}',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tx.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            DateFormat.yMMMMEEEEd().format(tx.date),
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
