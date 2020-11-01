import 'package:ESOF/style.dart';
import 'package:flutter/material.dart';

final BottomNavigationBar navigationBar = BottomNavigationBar(
  backgroundColor: accentOrange,
  type: BottomNavigationBarType.fixed,
  items: [
    BottomNavigationBarItem(
      icon:
          Image.asset("assets/icons/1x/single-folded-content.png", scale: 1.5),
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
);

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
