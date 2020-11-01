import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

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
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });    
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller: _titleController,
            onSubmitted: (_) => _submitData(),
            //onChanged: (val) {
            //titleInput = val;
            //},
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: _amountController,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => _submitData(),
            //onChanged: (val) => amountInput = val,
          ),
          Container(
            height: 70,
            child: Row(
              children: <Widget>[
                Expanded(child: Text(_selectedDate == null ? 'No Date Chosen!' : 'picked date: ${DateFormat.yMd().format(_selectedDate)}')),
                FlatButton(
                  textColor: Theme.of(context).primaryColor,
                  child: Text(
                    'Pick Date',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: _presentDatePicker,
                )
              ],
            ),
          ),
          RaisedButton(
            color: Colors.amber,
            textColor: Colors.white,
            child: Container(
              alignment: Alignment.centerRight,
              width: double.infinity,
              child: Text(
                'add transaction',
              ),
            ),
            onPressed: _submitData,
          )
        ],
      ),
    ));
  }
}
