import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/modals/transactions.modal.dart';

class NewTransaction extends StatelessWidget {
  final Function onAddNewTransaction;
  final nameController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction({@required this.onAddNewTransaction});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      child: Container(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Transaction Name: '),
              controller: nameController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Transaction Amount: '),
              controller: amountController,
            ),
            TextButton(
              onPressed: () {
                print('name: ${nameController.text}');
                print('amount: ${amountController.text}');
                onAddNewTransaction(Transaction(
                    id: 't_${nameController.text}',
                    name: nameController.text,
                    amount: double.parse(amountController.text),
                    date: DateTime.now()));
              },
              child: Text('add Transaction'),
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.blue)),
            )
          ],
        ),
      ),
    );
  }
}
