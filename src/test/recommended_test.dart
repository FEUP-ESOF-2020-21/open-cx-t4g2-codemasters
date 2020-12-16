import 'package:ESOF/screens/feed.dart';
import 'package:test/test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mockito/mockito.dart';

class DocumentReferenceMock extends Mock implements DocumentReference {
  final String documentID;
  DocumentReferenceMock(this.documentID);
}

class DocumentSnapshotMock extends Mock implements DocumentSnapshot {
  final DocumentReferenceMock docId;
  final Map<String, dynamic> info;
  DocumentSnapshotMock(this.docId, this.info);
}

void main() {
  test('Should recommend talks the user likes', () async {
    print('Starting test...');
    List<DocumentSnapshotMock> totalConferences = getConfs();
    List<String> userFavoriteTags = ['#FINANCES', '#TECH'];
    List<DocumentReference> userRatedConfs = [totalConferences[1].reference];

    final screen = FeedScreen();
    List<DocumentSnapshot> result = screen.filterRecommended(
        totalConferences, userFavoriteTags, userRatedConfs);

    // Specific Test
    expect(result[0].reference.documentID, '0');
    expect(result[1].reference.documentID, '3');
  });
}

List<DocumentSnapshotMock> getConfs() {
  List<Map<String, dynamic>> infos = [
    {
      'date': Timestamp.fromDate(DateTime.utc(2021, 12, 1)),
      'rate': 4.2,
      'tag': '#finances',
      'title': 'Conf 1',
    },
    {
      'date': Timestamp.fromDate(DateTime.utc(2020, 10, 5)),
      'rate': 3.9,
      'tag': '#finances',
      'title': 'Conf 2',
    },
    {
      'date': Timestamp.fromDate(DateTime.utc(2021, 1, 12)),
      'rate': 3.1,
      'tag': '#tech',
      'title': 'Conf 3',
    },
    {
      'date': Timestamp.fromDate(DateTime.utc(2021, 4, 17)),
      'rate': 4.7,
      'tag': '#finances',
      'title': 'Conf 4',
    }
  ];

  int numConfs = 4;
  List<DocumentSnapshotMock> totalConferences = [];
  for (int i = 0; i < numConfs; i++) {
    final Conf =
        DocumentSnapshotMock(DocumentReferenceMock(i.toString()), infos[i]);
    when(Conf.data()).thenReturn(Conf.info);
    when(Conf.reference).thenReturn(Conf.docId);
    totalConferences.add(Conf);
  }

  return totalConferences;
}
