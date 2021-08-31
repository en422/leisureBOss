import 'package:offline/widgets/datePicker/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerWidget extends StatefulWidget {
  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
   DateTime date = DateTime.now();

  String getText() {
    if (date == null) {
      return 'Select Date';
    } else {
      return DateFormat('dd/MM/yyyy').format(date);
    }
  }

  @override
  Widget build(BuildContext context) => ButtonHeaderWidget(
        title: 'Release date',
        text: getText(),
        onClicked: () => pickDate(context),
      );

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(DateTime.now().year - 150),
      lastDate: DateTime(DateTime.now().year + 100),
    );

    if (newDate == null) return;

    setState(() => date = newDate);
  }
}