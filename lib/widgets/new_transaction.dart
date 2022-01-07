// ignore_for_file: avoid_unnecessary_containers, avoid_print

import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final VoidCallback addTx;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              controller: amountController,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.amber)),
              onPressed: () {
                addTx(
                    titleController.text, double.parse(amountController.text));
              },
              child: const Text(
                'Add Transaction',
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextEditingController get newMethod => titleController;
}
