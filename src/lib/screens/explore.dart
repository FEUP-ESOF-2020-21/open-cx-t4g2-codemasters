import 'package:ESOF/model/conference.dart';
import 'package:ESOF/screens/post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../style.dart';

class ExploreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Conferences"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () =>
                  {showSearch(context: context, delegate: ConferenceSearch())})
        ],
        backgroundColor: accentOrange,
      ),
    );
  }
}

class ConferenceSearch extends SearchDelegate<String> {
  // If the conference has image return the url, otherwise returns a default.
  // Mudar para ficar mais modular!
  hasImage(conference) {
    return conference['img'] == null
        ? 'http://www.theides.org/img/about.jpg'
        : conference['img'];
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
  Widget buildSuggestions(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('Conference').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return new Text('Loading...');
        if (query == '') return new Text('');
        final results = snapshot.data.documents
            .where((a) => a.data()['title'].toString().contains(query));

        return ListView(
          children: results
              .map<Widget>((a) => ListTile(
                    title: Text(a.data()['title']),
                    onTap: () {
                      var conference = a.data();
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
                                  null))));
                    },
                  ))
              .toList(),
        );
      },
    );
  }
}
