import 'dart:io';

import 'package:ESOF/screens/utils/field.dart';
import 'package:ESOF/screens/utils/string_fomatting.dart';
import 'package:ESOF/style.dart';
import 'package:ESOF/ui_elements.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateConferenceScreen extends StatefulWidget {
  @override
  _CreateConferenceScreenState createState() => _CreateConferenceScreenState();
}

class _CreateConferenceScreenState extends State<CreateConferenceScreen> {
  String _title;
  DateTime _date;
  String _place;
  List<String> _speakers;
  final _picker = ImagePicker();
  File _image;

  Row generateGenericLabelFieldPair(String label) {
    String leftElemText = capitalizeFirstLetter(label) + ":";

    Function onSavedFunction;
    String hintText = "";

    switch (leftElemText) {
      case "Title:":
        {
          onSavedFunction = (String value) => this._title = value;
          hintText = "Insert the title here";
          break;
        }
      case "Date:":
        {
          onSavedFunction = (String value) {
            List<String> dateElems = value.split("/");
            this._date = DateTime(int.parse(dateElems.last),
                int.parse(dateElems[1]), int.parse(dateElems[0]));
          };
          hintText = "Insert the date here";
          break;
        }
      case "Place:":
        {
          onSavedFunction = (String value) => this._place = value;
          hintText = "Insert the place here";
          break;
        }
      case "Speakers:":
        {
          onSavedFunction = (String value) => this._speakers = value.split(",");
          hintText = "Insert the speakers here";
          break;
        }

      default:
        print("Invalid value for leftElemText!");
    }

    Field field = Field(
      onSaved: onSavedFunction,
      width: leftElemText == "Speakers:" ? 245 : 278,
      hintTxt: hintText,
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

  Future letUserPickImage() async {
    final image = await _picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (image != null)
        _image = File(image.path);
      else
        print("No image selected!");
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> listViewElems = [
      Container(
        child: Text(
          "Create Conference",
          style: bigText,
        ),
        margin: EdgeInsets.fromLTRB(20, 5, 0, 0),
      ),
      Container(
        child: Text(
          "Create here a post for the conference",
          style: smallerText,
        ),
        margin: EdgeInsets.fromLTRB(20, 0, 0, 20),
      ),
      bottomMargin20(generateGenericLabelFieldPair("title")),
      bottomMargin20(generateGenericLabelFieldPair("date")),
      bottomMargin20(generateGenericLabelFieldPair("place")),
      bottomMargin20(generateGenericLabelFieldPair("speakers")),
      Column(
        children: [
          Container(
            child: Text("Description:", style: mediumText),
            margin: EdgeInsets.fromLTRB(20, 0, 0, 20),
          ),
          Container(
            child: Field(
              height: 100,
              width: 350,
            ),
            margin: EdgeInsets.fromLTRB(30, 0, 30, 20),
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      Row(
        children: [
          Container(
            child: Text(
              "Upload Image:",
              style: mediumText,
            ),
            margin: EdgeInsets.fromLTRB(20, 30, 0, 0),
          ),
          GestureDetector(
            child: Container(
              child: _image == null
                  ? Image.asset(
                      "assets/icons/1x/plus_icon.png",
                      scale: 30,
                    )
                  : Image.file(
                      _image,
                      scale: 10,
                    ),
              margin: EdgeInsets.fromLTRB(100, 35, 0, 0),
            ),
            onTap: letUserPickImage,
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    ];

    return Scaffold(
      body: ListView(
        children: listViewElems,
      ),
    );
  }
}
