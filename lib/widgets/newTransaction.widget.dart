import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/modals/transactions.modal.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function onAddNewTransaction;
  NewTransaction({@required this.onAddNewTransaction});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _pickedDate;

  void _onSubmit() {
    final enteredName = _nameController.text;
    final enteredAmount = double.parse(_amountController.text);

    print('name: ${enteredName}');
    print('amount: ${enteredAmount}');
    print(
        'enteredName.isEmpty: ${enteredName.isEmpty}, enteredAmount <= 0: ${enteredAmount <= 0}');
    if (enteredName.isEmpty || enteredAmount <= 0 || _pickedDate == null)
      return;

    widget.onAddNewTransaction(
      Transaction(
        id: 't_${_nameController.text}',
        name: _nameController.text,
        amount: double.parse(_amountController.text),
        date: _pickedDate,
      ),
    );
    Navigator.of(context).pop();
  }

  void _displayDatePicker() {
    showDatePicker(
      context: context,
      initialDate: _pickedDate == null ? DateTime.now() : _pickedDate,
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) return;
      setState(() {
        _pickedDate = value;
      });
    });
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
              controller: _nameController,
              onSubmitted: (_) => _onSubmit(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Transaction Amount: '),
              controller: _amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _onSubmit(),
            ),
            Container(
              height: 77,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _pickedDate == null
                          ? 'No date Choosen'
                          : 'Picked Date: ${DateFormat.yMMMMEEEEd().format(_pickedDate)}',
                    ),
                  ),
                  TextButton(
                    onPressed: _displayDatePicker,
                    child: Text(
                      'Choose Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: _onSubmit,
              child: Text('add Transaction'),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.onPrimary),
                backgroundColor:
                    MaterialStateProperty.all(Theme.of(context).primaryColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
