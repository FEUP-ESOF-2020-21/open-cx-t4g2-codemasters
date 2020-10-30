import 'package:ESOF/style.dart';
import 'package:ESOF/ui_elements.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PostScreen extends StatelessWidget {
  final Conference _conf;

  PostScreen(this._conf);

  Row generateDateRow() {
    List<Widget> dateRowChildren = List();

    dateRowChildren.add(
      Container(
        child: Text(
          "Date:",
          style: mediumText,
        ),
      ),
    );

    dateRowChildren.add(
      Container(
        child: Text(
          "",
          style: mediumText,
        ),
      ),
    );

    Row result = Row(
      children: dateRowChildren,
    );
    return result;
  }

  Row generatePlaceRow() {
    List<Widget> placeRowChildren = List();

    placeRowChildren.add(
      Container(
        child: Text(
          "Place:",
          style: mediumText,
        ),
      ),
    );

    placeRowChildren.add(
      Container(
        child: Text(
          "",
          style: mediumText,
        ),
      ),
    );

    Row result = Row(
      children: placeRowChildren,
    );
    return result;
  }

  Row generateSpeakersRow() {
    List<Widget> speakerRowChildren = List();

    speakerRowChildren.add(
      Container(
        child: Text(
          "Speakers:",
          style: mediumText,
        ),
      ),
    );
    List<Widget> speakers = this._conf.getSpeakers();
    speakerRowChildren.add(
      Container(
        child: Column(
          children: speakers,
        ),
      ),
    );

    Row result = Row(
      children: speakerRowChildren,
    );

    return result;
  }

  Widget build(BuildContext context) {
    List<Widget> columnChildren = List();

    columnChildren.add(
      Container(
        child: Text(
          "Speakers:",
          style: mediumText,
        ),
      ),
    );
    Row dateRow = generateDateRow();
    Row placeRow = generatePlaceRow();
    columnChildren.add(dateRow);
    columnChildren.add(placeRow);
    Column scaffoldContent = Column(
      children: columnChildren,
    );

    Scaffold scaffold = Scaffold(
      appBar: appBar,
      bottomNavigationBar: navigationBar,
      body: scaffoldContent,
    );

    return scaffold;
  }
}
