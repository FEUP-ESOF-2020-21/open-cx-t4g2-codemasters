import 'package:ESOF/screens/create_conference.dart';
import 'package:ESOF/screens/explore.dart';
import 'package:ESOF/screens/feed.dart';
import 'package:ESOF/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:ESOF/style.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  var _pages;

  int _currentIndex = 1;
  int _lastIndex = 1;

  void revertToPrevScreen() {
    setState(() {
      _currentIndex = _lastIndex;
      _lastIndex = 1;
    });
  }

  _MyHomeState() {
    _pages = [
      CreateConferenceScreen(this, null),
      FeedScreen(),
      ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          key: Key("Bottom Bar"),
          backgroundColor: accentOrange,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset("assets/icons/1x/single-folded-content.png",
                  scale: 1.5),
              label: "Create post",
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/icons/1x/ic_home_48px.png", scale: 1.5),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: Image.asset("assets/icons/1x/single-01.png", scale: 1.5),
                label: "Profile"),
          ],
          onTap: (index) {
            setState(() {
              _lastIndex = _currentIndex;
              _currentIndex = index;
            });
          }),
    );
  }
}

AppBar buildAppBar(context) {
  return AppBar(
    title: Text("Rate-A-Talk"),
    actions: <Widget>[
      IconButton(
          key: Key("Search Icon"),
          icon: Icon(Icons.search),
          onPressed: () =>
              {showSearch(context: context, delegate: ConferenceSearch())})
    ],
    leading: Container(
      child: Image.asset("assets/icons/1x/app-logo.png", scale: 1.2),
      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
    ),
    backgroundColor: accentOrange,
  );
}
