import 'package:offline/widgets/datePicker/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:offline/widgets/datePicker/date_provider.dart';
import 'package:provider/provider.dart';

class DatePickerWidget extends StatefulWidget {
   DateTime date = DateTime.now();

  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
   

  String getText() {
    if (widget.date == null) {
      return 'Select Date';
    } else {
      return DateFormat('dd/MM/yyyy').format(widget.date);
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
    UploadDetail detail = Provider.of<UploadDetail>(context);
    final newDate = await showDatePicker(
      context: context,
      initialDate: widget.date,
      firstDate: DateTime(DateTime.now().year - 150),
      lastDate: DateTime(DateTime.now().year + 100),
    );

    if (newDate == null) return;

    setState(() { 
      widget.date = newDate;
      detail.setdatetime = (widget.date);
      });
  }
  
}