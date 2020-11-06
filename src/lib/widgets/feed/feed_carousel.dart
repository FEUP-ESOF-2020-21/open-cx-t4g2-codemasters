import 'package:ESOF/model/conference.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../style.dart';
import '../../screens/post.dart';

abstract class FeedCarousel extends StatelessWidget {
  final String title;
  List<Map<String, dynamic>> conferences = [];
  List<DocumentReference> conferencesRef =
      []; // Holds references to the Conferences in Firebase

  FeedCarousel(this.title, List<DocumentSnapshot> confs) {
    confs.forEach((conf) {
      this.conferences.add(conf.data());
      this.conferencesRef.add(conf.reference);

      // Stream<QuerySnapshot> inst = FirebaseFirestore.instance
      //     .collection('Conference_Speakers')
      //     .where('conference', isEqualTo: conf.reference)
      //     .snapshots();

      // inst.forEach((snapshot) {
      //   // print('... ' + conf.reference.id);
      //   if (snapshot.docs.length > 0) {
      //     print('--');
      //     DocumentReference aux = snapshot.docs[0].data()['speaker'];
      //     aux.get().then((value) => print(value.data()));
      //     // print(snapshot.docs[0].data()['speaker']);
      //     // print(snapshot.docs[1].data()['speaker'].id);
      //     print('--');
      //   }
      //   // DocumentReference newInst = FirebaseFirestore.instance
      //   //     .collection('Speaker')
      //   //     .doc(snapshot.docs[0].data()['speaker'].id);
      //   // print(newInst.get());
      // });
      // inst.map((snapshot) => snapshot.docs.forEach((doc) {
      //       print(doc.reference);
      //     }));
      // print(conf.reference);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                this.title,
                style: mediumText,
              ),
              GestureDetector(
                onTap: () => print('See all pressed'),
                child: Text(
                  'See All',
                  style: seeAllTextFeed,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 250.0,
          color: Colors.transparent,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: displayConferences(context),
          ),
        ),
      ],
    );
  }

  List<GestureDetector> displayConferences(context) {
    List<GestureDetector> containers = [];
    for (int i = 0; i < conferences.length; i++) {
      containers.add(
        GestureDetector(
          onTap: () {
            print('Entered in the conference info: ' + conferences[i]['title']);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PostScreen(new Conference(
                        'assets/images/conference_test.jpg',
                        conferences[i]['title'],
                        DateTime.fromMillisecondsSinceEpoch(
                            conferences[i]['date'].seconds * 1000),
                        conferences[i]['location'],
                        conferences[i]['description'],
                        conferences[i]['rate'],
                        conferences[i]['tag'],
                        conferencesRef[i]))));
          },
          child: Container(
            margin: EdgeInsets.all(10.0),
            width: 250,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    image: AssetImage('assets/images/conference_test.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 6),
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        conferences[i]['title'],
                        maxLines: 1,
                        textAlign: TextAlign.left,
                        style: mediumText,
                      ),
                      Text(
                        conferences[i]['description'],
                        overflow: TextOverflow.ellipsis,
                        style: descriptionTextFeed,
                        textAlign: TextAlign.left,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return containers;
  }
}
