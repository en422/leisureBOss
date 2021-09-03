import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:file_picker/file_picker.dart';

class UploadDetail with ChangeNotifier{
  DateTime dateTime = DateTime.now();
  PlatformFile imageFile = PlatformFile(size: 12,name: "");
  set setImageFile(PlatformFile file){
    this.imageFile;
    notifyListeners();
  }
  get getImageFile => this.imageFile;
  set setContentFile(PlatformFile file){
    this.contentFile = file;
    notifyListeners();
  }
  get getContetFile => this.contentFile;
  PlatformFile contentFile = PlatformFile(size: 12,name: "");
  set setdatetime(DateTime time) { this.dateTime = time;  notifyListeners();}
  get getdatetime => dateTime;
}