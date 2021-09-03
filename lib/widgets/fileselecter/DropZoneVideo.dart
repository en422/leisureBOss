import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:offline/widgets/datePicker/upload_provider.dart';
import 'package:offline/widgets/fileselecter/File_Data_Model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:provider/provider.dart';

class DropZoneVideo extends StatefulWidget {
  final ValueChanged<file_Data_Model> onDroppedFile;

  const DropZoneVideo({Key? key, required this.onDroppedFile})
      : super(key: key);
  @override
  _DropZoneVideoState createState() => _DropZoneVideoState();
}

class _DropZoneVideoState extends State<DropZoneVideo> {
  //controller to hold data of file dropped by user
  late DropzoneViewController controller;
  // a variable just to update UI color when user hover or leave the drop zone
  bool highlight = false;

    @override
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<PlatformFile>? _paths;
  String? _extension;
  bool _multiPick = false;
  FileType _pickingType = FileType.video;
  TextEditingController _controller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  set file(file_Data_Model file) {}
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();


void initState() {
    super.initState();
    _controller.addListener(() => _extension = _controller.text);
  }

  void _openFileExplorer() async {
    UploadDetail detail = Provider.of<UploadDetail>(context);
    try {
      _paths = (await FilePicker.platform.pickFiles(
        type: _pickingType,
        allowMultiple: _multiPick,
        allowedExtensions: (_extension?.isNotEmpty ?? false)
            ? _extension?.replaceAll(' ', '').split(',')
            : null,
      ))
          ?.files;
          setState(() {
            detail.setContentFile = _paths!.first;
          });
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    } catch (ex) {
      print(ex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return buildDecoration(
        child: Stack(
      children: [
        // dropzone area
        /*DropzoneView(
          // attach an configure the controller
          onCreated: (controller) => this.controller = controller,
          // call UploadedFile method when user drop the file
          onDrop: uploadedFile,
          // change UI when user hover file on dropzone
          onHover: () => setState(() => highlight = true),
          onLeave: () => setState(() => highlight = false),
          onLoaded: () => print('Zone Loaded'),
          onError: (err) => print('run when error found : $err'),
        ),*/

        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /*Icon(
                Icons.movie,
                size: 80,
                color: Colors.white,
              ),
              Text(
                'Drop Video Files Here',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              const SizedBox(
                height: 16
              ),*/
              // a button to pickfile from computer
               Padding(
                  padding: const EdgeInsets.only(top: 50.0, bottom: 20.0),
                  child: Column(
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () => _openFileExplorer(),
                        child: const Text("Open Video Picker"),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ],
    ));
  }

  Future uploadedFile(dynamic event) async {
    // this method is called when user drop the file in drop area in flutter

    final name = event.name;
    final mime = await controller.getFileMIME(event);
    final byte = await controller.getFileSize(event);
    final url = await controller.createFileUrl(event);

    print('Name : $name');
    print('Mime: $mime');

    print('Size : ${byte / (1024 * 1024)}');
    print('URL: $url');

    // update the data model with recent file uploaded
    final droppedFile =
        file_Data_Model(name: name, mime: mime, bytes: byte, url: url);

    //Update the UI
    widget.onDroppedFile(droppedFile);
    setState(() {
      highlight = false;
    });
  }

  Widget buildDecoration({required Widget child}) {
    final colorBackground = highlight ? Colors.blue : Colors.blueGrey[300];
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 120,
        width: 300,
        padding: EdgeInsets.all(10),
        child: DottedBorder(
            borderType: BorderType.RRect,
            color: Colors.white,
            strokeWidth: 3,
            dashPattern: [8, 4],
            radius: Radius.circular(10),
            padding: EdgeInsets.zero,
            child: child),
        color: colorBackground,
      ),
    );
  }
}
