import './widgets/new_transaction.dart';

import './widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import './models/Transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Tracker',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 5000, dateTime: DateTime.now()),
    Transaction(
        id: 't2', title: 'Groceries', amount: 2000, dateTime: DateTime.now()),
  ];

  void _addNewTransactions(String txTitle, double txAmount) {
    final newTx = Transaction(
        title: txTitle,
        amount: txAmount,
        dateTime: DateTime.now(),
        id: DateTime.now().toString());

    setState(() {
      _userTransactions.add(newTx);
    });

    void _startNewAddExpenses(BuildContext ctx) {
      showDialog(
        context: context,
        builder: (_) {
          return NewTransaction(_addNewTransactions);
        },
      );
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Expense Tracker'),
        ),
        body: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  child: Card(
                    color: Colors.blue,
                    child: Text('Chart'),
                    elevation: 5,
                  ),
                ),
              ),
              TransactionList(_userTransactions),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton:
            FloatingActionButton(child: Icon(Icons.add), onPressed: ()=> _startNewAddExpenses(context)),
      );
    }
  }
}
