// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import '../widgets/transaction_list.dart';
//import './widgets/new_transaction.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({Key? key}) : super(key: key);

  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: 't1', title: 'My New Shoes', amount: 60.75, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'My New Clothes', amount: 79.45, date: DateTime.now()),
    Transaction(
        id: 't3', title: 'Groceries', amount: 16.78, date: DateTime.now()),
  ];

  void _addNewTransaction(String txTitle, txAmount) {
    var newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionList(_userTransactions),
      ],
    );
  }
}
