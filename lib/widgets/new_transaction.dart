import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleInputController = TextEditingController();
  final amountInputController = TextEditingController();

  NewTransaction(this.addTx);

  void submitData(String Data) {
    final enteredTitle = titleInputController.text;
    final enteredAmount = double.parse(amountInputController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    addTx(enteredTitle, enteredAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextField(
                decoration: InputDecoration(labelText: 'Enter Title'),
                controller: titleInputController,
                onSubmitted: (_) => submitData,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextField(
                decoration: InputDecoration(labelText: 'Enter Amount'),
                controller: amountInputController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: ElevatedButton(
                child: Text(
                  'Add Transaction',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => submitData,
              ),
            )
          ],
        ),
      ),
    );
  }
}
