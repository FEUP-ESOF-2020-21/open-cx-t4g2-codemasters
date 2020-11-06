
import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search App"),
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
  
}