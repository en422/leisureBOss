import 'dart:html';
import 'package:file_picker/file_picker.dart';
import 'package:provider/provider.dart';
import '../utils/utils.dart';
import '../models/models.dart';
import '../services/services.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ContentCreator {
  late ContentModel content;
  late PlatformFile imageFile;
  late PlatformFile contentFile;
  bool status = false;

  ContentCreator(
      {required this.content,
      required this.imageFile,
      required this.contentFile});

  Future<bool> createContentWithFile() async {
    print("in create content with file");
    ContentService contentService = ContentService();
    print("second print");
    await contentService.createContent(content);
    FileService fileService = FileService(
        content: this.content,
        imageFile: this.imageFile,
        contentFile: this.contentFile);
    fileService.uploadFile();
    print("third print");

    return status;
  }
}
