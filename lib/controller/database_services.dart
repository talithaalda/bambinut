import 'package:path/path.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class DatabaseServices {
  static Future<String> uploadProfile(File imageFile, String userId) async {
    String filename = basename(imageFile.path);
    Reference ref = FirebaseStorage.instance.ref('$userId.jpg');
    UploadTask task = ref.putFile(imageFile);
    TaskSnapshot snapshot = await task;
    return await snapshot.ref.getDownloadURL();
  }

  static Future<String> uploadImageFood(File imageFile, String foodId) async {
    String filename = basename(imageFile.path);
    Reference ref = FirebaseStorage.instance.ref().child("$foodId.png");
    UploadTask task = ref.putFile(imageFile);
    TaskSnapshot snapshot = await task;
    return await snapshot.ref.getDownloadURL();
  }
}
