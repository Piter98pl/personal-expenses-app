import 'dart:math';
import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  const NewTransaction(this.addNewTransaction);
  final Function addNewTransaction;

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final productNameController = TextEditingController();

  final priceController = TextEditingController();

  void submitData() {
    final enteredName = productNameController.text;
    final enteredPrice = double.parse(priceController.text);

    if (enteredName.isEmpty || enteredPrice <= 0) {
      return;
    }
    widget.addNewTransaction(
      Random().nextInt(1000),
      enteredName,
      enteredPrice,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              autofocus: true,
              onSubmitted: (_) => submitData(),
              controller: productNameController,
              cursorColor: Theme.of(context).colorScheme.primary,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 2.0)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 2.0)),
                labelText: 'Wprowadź nazwę produktu',
                labelStyle:
                    TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              onSubmitted: (_) => submitData(),
              keyboardType: TextInputType.number,
              controller: priceController,
              cursorColor: Theme.of(context).colorScheme.primary,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 2.0)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 2.0)),
                labelText: 'Wprowadź kwotę ',
                labelStyle:
                    TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                  side:
                      BorderSide(color: Theme.of(context).colorScheme.primary)),
              onPressed: submitData,
              child: Text(
                'Dodaj wydatek',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
