import '../models/models.dart';
import '../utils/utils.dart';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';

class FileService {
  late ContentModel content;
  late PlatformFile imageFile;
  late PlatformFile contentFile;
  String imageFileUrl = "";
  String contentFileUrl = "";

  String storageRef = "gs://leisure-lounge.appspot.com/contents/";
  FileService(
      {required this.imageFile,
      required this.contentFile,
      required this.content});

  Future<bool> uploadFile() async {
    String newPath = content.id.toString();
    final FileReader imageReader = FileReader();
    try {
      imageReader.readAsDataUrl(imageFile as File);
      imageReader.onLoadEnd.listen((event) async {
        print("image file reading completed");
        await firebaseStorage
            .refFromURL(storageRef)
            .child(newPath)
            .putBlob(imageFile);
        String uri = storageRef + newPath + "/" + imageFile.name;
        imageFileUrl = await firebaseStorage.refFromURL(uri).getDownloadURL();
        firebaseFirestore
            .collection("contents")
            .doc(content.id)
            .update({"imageUrl": uri});
      });
      final FileReader contentReader = FileReader();
      contentReader.readAsDataUrl(contentFile as File);
      contentReader.onLoadEnd.listen((event) async {
        print("content file reading completed");
        await firebaseStorage
            .refFromURL(storageRef)
            .child(newPath)
            .putBlob(contentFile);
        String uri = storageRef + newPath + "/" + contentFile.name;
        contentFileUrl = await firebaseStorage.refFromURL(uri).getDownloadURL();
        firebaseFirestore
            .collection("contents")
            .doc(content.id)
            .update({"contentUrl": contentFileUrl});
      });
      return true;
    } on Exception catch (e) {
      print("some error occured while uploading file");
      return false;
    }
  }
}
