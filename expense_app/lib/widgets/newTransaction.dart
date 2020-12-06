import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Item'),
              controller:
                  titleController, // Listen to the input and safe into it
              // onChanged: (value) {
              //   titleInupt = value;
              // },
            ), // receiving user inputs.

            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              // onChanged: (value) {
              //   amountInput = value;
              // },
            ),
            FlatButton(
              child: Text('Add'),
              textColor: Colors.blue,
              onPressed: () {
                addTx(
                  titleController.text,
                  double.parse(
                      amountController.text), //parse() changes to double
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
