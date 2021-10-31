import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePage extends StatefulWidget {
  const DatePage({Key? key}) : super(key: key);

  @override
  _DatePageState createState() => _DatePageState();
}

class _DatePageState extends State<DatePage> {
  DateTime _selectedDate = DateTime.now();
  final DateFormat _dateFormat = DateFormat('dd-MM-yyyy');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            onPressed: () {
              _getDate(context);
            },
            child: const Text(
              'Date Picker', 
              style: TextStyle(color: Colors.redAccent),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'Selected date : ' + _dateFormat.format(_selectedDate),
            style: const TextStyle(color: Colors.white),
          )
        ],
      )),
    );
  }

  _getDate(context) async {
    final _datePick = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: _selectedDate.subtract(Duration(days: 30)),
      lastDate: DateTime(_selectedDate.year + 1),
    );

    if (_datePick != null) {
      setState(() {
        _selectedDate = _datePick;
      });
    }
  }
}
