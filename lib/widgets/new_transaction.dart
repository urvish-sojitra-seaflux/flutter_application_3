import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  const NewTransaction(this.addTx, {Key? key}) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTx(titleController.text, double.parse(amountController.text));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextField(
            decoration: const InputDecoration(labelText: 'Title'),
            controller: titleController,
            onSubmitted: (_) => submitData,
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Amount'),
            keyboardType: TextInputType.number,
            controller: amountController,
            onSubmitted: (_) => submitData,
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.grey)),
            onPressed: () {
              widget.addTx(
                  titleController.text, double.parse(amountController.text));
            },
            child: const Text(
              'Add Transaction',
            ),
          ),
        ],
      ),
    );
  }
}
