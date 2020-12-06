import 'package:ESOF/model/conference.dart';
import 'package:ESOF/screens/post.dart';
import 'package:ESOF/widgets/common/feed_common.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ConferenceSearch extends SearchDelegate<String> {
  // If the conference has image return the url, otherwise returns a default.
  // Mudar para ficar mais modular!

  bool _checkIfQueryContains(DocumentSnapshot doc, String keyword) {
    return doc
        .data()[keyword]
        .toString()
        .toLowerCase()
        .contains(query.toLowerCase());
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {}

  @override
  Widget buildSuggestions(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('Conference').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return new Text('Loading...');
        if (query == '') return new Text('');

        var results = snapshot.data.documents.where((a) =>
            _checkIfQueryContains(a, 'title') ||
            _checkIfQueryContains(a, 'location') ||
            _checkIfQueryContains(a, 'tag'));

        return ListView(
          children: results
              .map<Widget>((result) => ListTile(
                    title: Text(result.data()['title']),
                    onTap: () {
                      var conference = result.data();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              //mudar para novo contrutor
                              builder: (context) => PostScreen(new Conference(
                                  hasImage(conference),
                                  conference['title'],
                                  DateTime.fromMillisecondsSinceEpoch(
                                      conference['date'].seconds * 1000),
                                  conference['location'],
                                  conference['description'],
                                  conference['rate'],
                                  conference['tag'],
                                  // nao percebi o que é o reference. Por enquanto está a null e funciona
                                  result.reference))));
                    },
                  ))
              .toList(),
        );
      },
    );
  }
}
