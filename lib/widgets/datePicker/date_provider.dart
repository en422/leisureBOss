import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UploadDetail with ChangeNotifier{
  DateTime dateTime = DateTime.now();
  set setdatetime(DateTime time) { this.dateTime = time;
  notifyListeners();}
  get getdatetime => dateTime;
}