import 'package:flutter/material.dart';
import 'package:offline/navigationDrawer/navigationDrawer.dart';
import 'package:offline/navigationDrawer/responsive.dart';
import 'package:offline/routes/pageRoute.dart';
import 'package:offline/widgets/datePicker/date_picker_widget.dart';
import 'package:offline/widgets/dropZone/DropZoneWidget.dart';
//import 'package:offline/widgets/dropZone/DroppedFileWidget.dart';
import 'package:offline/widgets/dropZone/File_Data_Model.dart';
import 'package:provider/provider.dart';
import 'package:offline/navigationDrawer/MenuController.dart';
import 'package:offline/pages/header.dart';

import '../constants.dart';

// this is used to upload files to firestore is has a formfield to register different items
class Upload extends StatefulWidget {
  static const String routeName = '/uploadpage';
  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  String genrevalue = 'Action';
  String typevalue = 'Movie';
  String rating = '1';
  var items = [
    'Action',
    'Comedy',
    'Fantasy',
    'Horror',
    'Mystery',
    'Drama',
    'Romance',
    'Thriller',
    'Romantic comedy',
    'Action comedy',
    'Unknown'
  ];
  var type = ['Movie', 'Music'];
  var rate = ['0', '1', '2', '3', '4', '5'];
  final formKey = GlobalKey<FormState>();

  set file(file_Data_Model file) {}
  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //var file;
    return new Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 50),
          child: Header()),
      drawer: NavigationDrawer(),
      body: SingleChildScrollView(
          child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            //container for the file drop widget
            Container(
              height: 300,
              child: DropZoneWidget(
                onDroppedFile: (file) => setState(() => this.file = file),
              ),
            ),
            SizedBox(height: 15),
            //DroppedFileWidget(file:file ),
            //the textformfield for the filename

            Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding,
                  vertical: defaultPadding / 2,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Enter File Name',
                  ),
                  controller: name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Valid Name!";
                    } else {
                      return value;
                    }
                  },
                )),
            Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding,
                  vertical: defaultPadding / 2,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Rating:',
                      overflow: TextOverflow.clip,
                      //style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 25),
                    DropdownButton<String>(
                      value: rating,
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: rate.map((String items) {
                        return DropdownMenuItem(
                            value: items, child: Text(items));
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          rating = newValue!;
                        });
                      },
                    ),
                  ],
                )),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: defaultPadding,
                vertical: defaultPadding / 2,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      height: 100,
                      width: 300,
                      child: DatePickerWidget())
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding,
                  vertical: defaultPadding / 2,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'File Type:',
                      overflow: TextOverflow.clip,
                      //style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 25),
                    DropdownButton<String>(
                      hint: Text('Choose File type'),
                      value: typevalue,
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: type.map((String items) {
                        return DropdownMenuItem(
                            value: items, child: Text(items));
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          typevalue = newValue!;
                        });
                      },
                    ),
                  ],
                )),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: defaultPadding,
                vertical: defaultPadding / 2,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Genre:',
                    //textAlign: TextAlign.center,
                    overflow: TextOverflow.clip,
                    //style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 25),
                  DropdownButton<String>(
                    hint: Text('Choose Genre'),
                    value: genrevalue,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: items.map((String items) {
                      return DropdownMenuItem(value: items, child: Text(items));
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        genrevalue = newValue!;
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: defaultPadding,
                vertical: defaultPadding / 2,
              ),
              child: TextFormField(
                maxLines: 7,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Description',
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding,
                  vertical: defaultPadding / 2,
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  ElevatedButton(
                    child: Text('Upload'),
                    onPressed: () {
                      //******************************************************************** */
                      if (formKey.currentState!.validate()) {
                        Navigator.pushReplacementNamed(
                            context, PageRoutes.user);
                      }
                    },
                  ),
                ])),

            if (!Responsive.isMobile(context))
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
              )
          ],
        ),
      )),
    );
  }
}
