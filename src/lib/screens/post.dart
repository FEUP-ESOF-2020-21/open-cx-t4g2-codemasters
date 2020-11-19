import 'package:ESOF/model/conference.dart';
import 'package:ESOF/model/speaker.dart';
import 'package:ESOF/screens/utils/string_fomatting.dart';
import 'package:ESOF/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PostScreen extends StatelessWidget {
  final Conference _conf;

  PostScreen(this._conf);

  /**
   * Function that returns a row with two elements: two Text widgets, the first one having a processed 
   * string derived from the function's parameter and the second one is extracted from the conference
   * used to build this widget
   **/
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
      ),
      margin: EdgeInsets.only(left: 10),
    ));

    return Row(
      children: rowChildren,
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }

  /// Function that returns a row with two elements: a text box with the text "Speakers:" and a column with the speakers
  Row generateSpeakersRows(List<Speaker> speakers) {
    List<Widget> speakerRowChildren = List();

    speakerRowChildren.add(Container(
        child: Text(
      "Speakers:",
      style: mediumText,
    )));

    // this._conf.getSpeakers()

    List<Widget> widgSpeakers = List();

    for (var speaker in speakers) {
      List<Widget> individualSpeakerRowChildren = List();

      individualSpeakerRowChildren.add(Container(
        child: Image.asset(
          speaker.imagePath,
          scale: 20,
        ),
        padding: EdgeInsets.only(right: 10),
      ));

      individualSpeakerRowChildren.add(Container(
        child: Text(
          speaker.name,
          style: mediumText,
        ),
        padding: EdgeInsets.only(bottom: 10),
      ));

      widgSpeakers.add(Row(
        children: individualSpeakerRowChildren,
      ));
    }

    speakerRowChildren.add(
      Container(
        child: Column(
          children: widgSpeakers,
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
        margin: EdgeInsets.only(left: 10),
      ),
    );

    return Row(
      children: speakerRowChildren,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  Column generateTagColumn() {
    List<Widget> columnElems = List();

    columnElems.add(Container(
      child: Text(
        "Tag:",
        style: mediumText,
      ),
      margin: EdgeInsets.only(bottom: 15, top: 15),
    ));

    columnElems.add(Container(
      child: Text(
        this._conf.tag,
        style: smallerText,
      ),
    ));

    return Column(
      children: columnElems,
    );
  }

  Column generateDescriptionColumn() {
    List<Widget> columnElems = List();

    columnElems.add(Container(
      child: Text(
        "Description:",
        style: mediumText,
      ),
      margin: EdgeInsets.only(bottom: 15),
    ));

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

    stackChildren.add(ClipRRect(
      child: Container(
        child: Image.asset(this._conf.photoPath),
      ),
      borderRadius: BorderRadius.circular(22),
    ));
    stackChildren.add(Container(
      child: Text(this._conf.title, style: bigTextWhite),
    ));

    return Stack(
      children: stackChildren,
      alignment: AlignmentDirectional.bottomCenter,
    );
  }

  Widget build(BuildContext context) {
    List<Widget> listViewElems = List();

    Stack imageStack = generateImageStack();
    Row dateRow = generateGenericRow("date");
    Row placeRow = generateGenericRow("place");
    Container speakersRow = Container(
        child: FutureBuilder(
      future: this._conf.getSpeakers(),
      builder: (context, snapshot) {
        if (snapshot.hasData)
          return generateSpeakersRows(snapshot.data);
        else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ));
    // Row speakersRow = generateSpeakersRows();
    Column descriptionColumn = generateDescriptionColumn();
    Column tagColumn = generateTagColumn();

    listViewElems.add(imageStack);
    listViewElems.add(SizedBox(height: 20));
    listViewElems.add(dateRow);
    listViewElems.add(SizedBox(height: 20));
    listViewElems.add(placeRow);
    listViewElems.add(SizedBox(height: 20));
    listViewElems.add(speakersRow);
    listViewElems.add(SizedBox(height: 20));
    listViewElems.add(descriptionColumn);
    listViewElems.add(tagColumn);

    Scaffold scaffold = Scaffold(
      body: ListView(
        children: listViewElems,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      ),
    );

    return scaffold;
  }
}
