import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/chartBar.wiget.dart';
import '../modals/transactions.modal.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get chartData {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      var totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        print(
            'weekDay: ${DateFormat('yyyy/MM/dd').format(weekDay)}, recentTransactions: ${DateFormat('yyyy/MM/dd').format(recentTransactions[i].date)}');
        if (DateFormat('yyyy/MM/dd').format(weekDay) ==
            DateFormat('yyyy/MM/dd').format(recentTransactions[i].date)) {
          totalSum += recentTransactions[i].amount;
        }
      }

      print('day: ${DateFormat.E().format(weekDay)}');
      print('amount: ${totalSum}');
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return chartData.fold(0.0, (previousValue, element) {
      return previousValue + element['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(chartData);
    return Card(
      elevation: 7,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: chartData.map((tx) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                  day: tx['day'],
                  spendingAmount: tx['amount'],
                  spendingPctOfTotal: totalSpending == 0.0
                      ? 0
                      : (tx['amount'] as double) / totalSpending),
            );
          }).toList(),
        ),
      ),
    );
  }
}
