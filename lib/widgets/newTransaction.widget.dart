import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/modals/transactions.modal.dart';

class NewTransaction extends StatefulWidget {
  final Function onAddNewTransaction;
  NewTransaction({@required this.onAddNewTransaction});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final nameController = TextEditingController();

  final amountController = TextEditingController();

  void onSubmit() {
    final enteredName = nameController.text;
    final enteredAmount = double.parse(amountController.text);

    print('name: ${enteredName}');
    print('amount: ${enteredAmount}');
    print(
        'enteredName.isEmpty: ${enteredName.isEmpty}, enteredAmount <= 0: ${enteredAmount <= 0}');
    if (enteredName.isEmpty || enteredAmount <= 0) return;

    widget.onAddNewTransaction(Transaction(
        id: 't_${nameController.text}',
        name: nameController.text,
        amount: double.parse(amountController.text),
        date: DateTime.now()));
    Navigator.of(context).pop();
  }

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
              onSubmitted: (_) => onSubmit(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Transaction Amount: '),
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => onSubmit(),
            ),
            TextButton(
              onPressed: onSubmit,
              child: Text('add Transaction'),
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(
                      Theme.of(context).primaryColor)),
            )
          ],
        ),
      ),
    );
  }
}
