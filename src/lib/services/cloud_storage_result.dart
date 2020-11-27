import 'package:firebase_storage/firebase_storage.dart';

class CloudStorageResult {
  String imageUrl;
  final String imageFileName;

  CloudStorageResult(this.imageFileName);

  urlImage() async {
    final ref = FirebaseStorage.instance.ref().child(this.imageFileName);
    this.imageUrl = await ref.getDownloadURL();
  }
}

