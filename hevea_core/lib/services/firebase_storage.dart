import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hevea_core/utilis/logger/g_logger.dart';

class FirebaseStorageService {
  static final FirebaseStorage storage = FirebaseStorage.instance;

  // Upload a file to Firebase Storage
  static Future<String> uploadFile({required path, required File file}) async {
    try {
      // Upload the file to the path in Firebase Storage
      await storage.ref(path).putFile(file);

      // Get the download URL for the uploaded file
      final String downloadUrl = await storage.ref(path).getDownloadURL();
      return downloadUrl;
    } catch (e) {
      e.logException();
      rethrow;
    }
  }

  // Download a file from Firebase Storage
  static Future<File> downloadFile(
      {required String path, required String localPath}) async {
    try {
      // Create a File instance for the local path
      final File localFile = File(localPath);

      // Download the file from Firebase Storage
      await storage.ref(path).writeToFile(localFile);
      return localFile;
    } catch (e) {
      e.logException();
      rethrow;
    }
  }
}
