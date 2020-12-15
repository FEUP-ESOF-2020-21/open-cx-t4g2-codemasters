import 'package:ESOF/screens/feed.dart';
import 'package:test/test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  test('Should recommend talks the user likes', () async {
    final screen = FeedScreen();

    var queryDocumentSnapshotsList = await FirebaseFirestore.instance
        .collection("Conference")
        .snapshots()
        .toList();

    var snapshots =
        queryDocumentSnapshotsList.map((elem) => elem.docs).toList();

    //expect();
  });
}
