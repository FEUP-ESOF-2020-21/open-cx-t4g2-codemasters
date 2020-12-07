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
      ExploreScreen(),
      ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
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
              icon: Image.asset("assets/icons/1x/zoom-2.png", scale: 1.5),
              label: "Explore",
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/icons/1x/single-01.png", scale: 1.5),
              label: "Profile",
            ),
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

final AppBar appBar = AppBar(
  actions: [
    Container(
      child: new Text("Rate-A-Talk", style: mediumText),
      padding: EdgeInsets.fromLTRB(0, 18, 15, 0),
    )
  ],
  leading: Container(
    child: new Text("Logo", style: smallerText),
    padding: EdgeInsets.fromLTRB(15, 18, 0, 0),
    //width: double.infinity,
  ),
  backgroundColor: accentOrange,
);
