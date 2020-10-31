import 'package:ESOF/model/conference.dart';
import 'package:ESOF/model/speaker.dart';
import 'package:ESOF/screens/utils/string_fomatting.dart';
import 'package:ESOF/style.dart';
import 'package:ESOF/ui_elements.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PostScreen extends StatelessWidget {
  final Conference _conf;

  PostScreen(this._conf);

  Row generateGenericRow(String content) {
    String leftElemText = capitalizeFirstLetter(content);
    leftElemText += ":";

    String rightElemText = "";

    switch (content) {
      case "date":
        {
          rightElemText = formatDate(this._conf.date);
          break;
        }
      case "place":
        {
          rightElemText = this._conf.place;
          break;
        }
      default:
        print("Invalid parameter passed to generateGenericRow!");
    }

    List<Widget> rowChildren = List();

    rowChildren.add(Container(
        child: Text(
      leftElemText,
      style: mediumText,
    )));
    rowChildren.add(Container(
        child: Text(
      rightElemText,
      style: mediumText,
    )));

    return Row(
      children: rowChildren,
    );
  }

  /// Function that returns a row with two elements: a text box with the text "Speakers:" and a column with the speakers
  Row generateSpeakersRows() {
    List<Widget> speakerRowChildren = List();

    speakerRowChildren.add(Container(
        child: Text(
      "Speakers:",
      style: mediumText,
    )));

    List<Speaker> speakers = (this._conf.speakers);
    List<Widget> widgSpeakers = List();

    for (var i in speakers) {
      widgSpeakers.add(Container(
          child: Text(
        i.name,
        style: mediumText,
      )));
    }

    speakerRowChildren.add(
      Container(
        child: Column(
          children: widgSpeakers,
        ),
      ),
    );

    return Row(
      children: speakerRowChildren,
    );
  }

  Column generateDescriptionColumn() {
    List<Widget> columnElems = List();

    columnElems.add(Container(
        child: Text(
      "Description:",
      style: mediumText,
    )));

    columnElems.add(Container(
      child: Text(
        this._conf.description,
        style: smallerText,
      ),
    ));

    return Column(
      children: columnElems,
    );
  }

  Stack generateImageStack() {
    List<Widget> stackChildren = List();

    stackChildren.add(Container(
      child: Image.asset(this._conf.photoPath),
    ));
    stackChildren.add(Container(
      child: Text(this._conf.title, style: bigText),
    ));

    return Stack(
      children: stackChildren,
    );
  }

  Widget build(BuildContext context) {
    List<Widget> listViewElems = List();

    Stack imageStack = generateImageStack();
    Row dateRow = generateGenericRow("date");
    Row placeRow = generateGenericRow("place");
    Row speakersRow = generateSpeakersRows();
    Column descriptionColumn = generateDescriptionColumn();

    listViewElems.add(imageStack);
    listViewElems.add(dateRow);
    listViewElems.add(placeRow);
    listViewElems.add(speakersRow);
    listViewElems.add(descriptionColumn);

    Scaffold scaffold = Scaffold(
      appBar: appBar,
      bottomNavigationBar: navigationBar,
      body: ListView(
        children: listViewElems,
      ),
    );

    return scaffold;
  }
}
