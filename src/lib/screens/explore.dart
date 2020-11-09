
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Conferences"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () => {
            showSearch(context: context, delegate: ConferenceSearch())
          })
        ],
      ),
      drawer: Drawer(),
    );
  }
}

class ConferenceSearch extends SearchDelegate<String> {
  final _allConferences = ["HELLO","MEGA CONFERENCIA", "WE LOVE YOU_ CONF"];
  final _lastConferences = ["HELLO"];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: () {
      query = "";
    })];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: AnimatedIcon(
      icon: AnimatedIcons.menu_arrow,
      progress: transitionAnimation,
    ), onPressed: () {
      close(context, null);
    });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }
/*
  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty ?
      _lastConferences:
      _allConferences.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
        itemBuilder: (context, index) => ListTile(
          leading: Icon(Icons.location_city),
          title: Text(suggestionList[index]),
        ),
      itemCount: suggestionList.length,
    );
  }
*/
  @override
  Widget buildSuggestions(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('Conference').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return new Text('Loading...');
        if(query == '') return new Text('');
        final results = snapshot.data.documents.where((a) =>
            a.data()['title'].toString().contains(query));
       var b;
       for (b in results){
         print(b);
       }

        return ListView(
          children: results.map<Widget>((a) => ListTile( title : Text(a.data()['title']))).toList(),
        );

      },
    );
  }

}