import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

// This class uploads a image to the database
class CloudStorageService {
  File imgFile;
  CloudStorageService(this.imgFile);

  uploadImage() async {
    var imageFileName = DateTime.now().millisecondsSinceEpoch.toString();
    // Get the reference to the file we want to create
    final firebaseStorageRef =
        FirebaseStorage.instance.ref().child(imageFileName);

    // upload
    StorageUploadTask storageSnapshot = firebaseStorageRef.putFile(imgFile);
    await storageSnapshot.onComplete;
    String returnURL;
    await firebaseStorageRef.getDownloadURL().then((fileURL) {
      returnURL = fileURL;
    });
    return returnURL;
  }
}
