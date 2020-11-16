import 'package:ESOF/screens/utils/field.dart';
import 'package:ESOF/screens/utils/string_fomatting.dart';
import 'package:ESOF/style.dart';
import 'package:ESOF/ui_elements.dart';
import 'package:flutter/material.dart';

class CreateConferenceScreen extends StatefulWidget {
  @override
  _CreateConferenceScreenState createState() => _CreateConferenceScreenState();
}

class _CreateConferenceScreenState extends State<CreateConferenceScreen> {
  String _title;
  DateTime _date;
  String _place;
  List<String> _speakers;

  Row generateGenericLabelFieldPair(String label) {
    String leftElemText = capitalizeFirstLetter(label) + ":";

    Function onSavedFunction;

    switch (leftElemText) {
      case "Title:":
        {
          onSavedFunction = (String value) => this._title = value;
          break;
        }
      case "Date:":
        {
          onSavedFunction = (String value) {
            List<String> dateElems = value.split("/");
            this._date = DateTime(int.parse(dateElems.last),
                int.parse(dateElems[1]), int.parse(dateElems[0]));
          };
          break;
        }
      case "Place:":
        {
          onSavedFunction = (String value) => this._place = value;
          break;
        }
      case "Speakers:":
        {
          onSavedFunction = (String value) => this._speakers = value.split(",");
          break;
        }

      default:
        print("Invalid value for leftElemText!");
    }

    Field field = Field(
      onSaved: onSavedFunction,
      width: leftElemText == "Speakers:" ? 250 : 278,
    );

    List<Widget> rowElems = [
      Container(
        child: Text(
          leftElemText,
          style: mediumText,
        ),
        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
      ),
      Container(
        child: field,
      )
    ];

    return Row(
      children: rowElems,
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> listViewElems = [
      Text(
        "Create Conference",
        style: bigText,
      ),
      bottomMargin20(
          Text("Create here a post for the conference", style: smallerText)),
      bottomMargin20(generateGenericLabelFieldPair("title")),
      bottomMargin20(generateGenericLabelFieldPair("date")),
      bottomMargin20(generateGenericLabelFieldPair("place")),
      bottomMargin20(generateGenericLabelFieldPair("speakers")),
    ];

    return Scaffold(
      body: ListView(
        children: listViewElems,
      ),
    );
  }
}
