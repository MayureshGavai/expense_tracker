import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleInputController = TextEditingController();
  final _amountInputController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  void _submitData() {
    final enteredTitle = _titleInputController.text;
    final enteredAmount = double.parse(_amountInputController.text);
    if (_amountInputController.text.isEmpty) {
      return;
    }
    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addTx(enteredTitle, enteredAmount, _selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
    print('...');
  }

  @override
  Widget build(BuildContext context) {
    return
        //Padding(
        //  padding: const EdgeInsets.all(8.0),
        //  child:
        //  Card(
        // elevation: 5,
        //child:
        Column(
      children: <Widget>[
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
        //   child:
        TextField(
          decoration: InputDecoration(labelText: 'Enter Title'),
          controller: _titleInputController,
          onSubmitted: (_) => _submitData(),
        ),
        //  ),
        //  Padding(
        //    padding: const EdgeInsets.symmetric(horizontal: 10.0),
        //    child:
        TextField(
          decoration: InputDecoration(labelText: 'Enter Amount'),
          controller: _amountInputController,
          keyboardType: TextInputType.number,
          onSubmitted: (_) => _submitData(),
        ),
        //  ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Text(
                  _selectedDate == null
                      ? 'No Date Chosen!'
                      : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                ),
              ),
              TextButton(
                  child: Text(
                    'Choose Date',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  onPressed: _presentDatePicker)
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: ElevatedButton(
            child: Text(
              'Add Transaction',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            onPressed: _submitData,
          ),
        )
      ],
      //  ),
      //  ),
    );
    //);
  }
}
