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

    rowChildren.add(getContainerizedText(leftElemText));
    rowChildren.add(getContainerizedText(rightElemText));

    return Row(
      children: rowChildren,
    );
  }

  /// Function that returns a row with two elements: a text box with the text "Speakers:" and a column with the speakers
  Row generateSpeakersRows() {
    List<Widget> speakerRowChildren = List();

    speakerRowChildren.add(getContainerizedText("Speakers:"));

    List<Speaker> speakers = (this._conf.speakers);
    List<Widget> widgSpeakers = List();

    for (var i in speakers) {
      widgSpeakers.add(getContainerizedText(i.name));
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

    columnElems.add(getContainerizedText("Description:"));
    columnElems.add(getContainerizedText(this._conf.description, smallerText));

    return Column(
      children: columnElems,
    );
  }

  Widget build(BuildContext context) {
    List<Widget> listViewElems = List();

    Row dateRow = generateGenericRow("date");
    Row placeRow = generateGenericRow("place");
    Row speakersRow = generateSpeakersRows();
    Column descriptionColumn = generateDescriptionColumn();

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
