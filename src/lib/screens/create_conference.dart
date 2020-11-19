import 'dart:io';

import 'package:ESOF/screens/utils/field.dart';
import 'package:ESOF/screens/utils/string_fomatting.dart';
import 'package:ESOF/style.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ESOF/model/conferenceModel.dart';

class CreateConferenceScreen extends StatefulWidget {
  final _home;

  CreateConferenceScreen(this._home);

  @override
  _CreateConferenceScreenState createState() =>
      _CreateConferenceScreenState(_home);
}

String dateValidator(String value) {
  bool containsTwoSlashes = value.contains("/", 0) && value.contains("/", 3);
  if (!containsTwoSlashes)
    return "Date must contain the character '/' twice to separate the date elements.";

  List<int> dateElems = (value.split("/")).map((e) => int.parse(e)).toList();

  bool isUsingWrongDateFormat = dateElems[0] > 999 && dateElems[2] < 1000;
  if (isUsingWrongDateFormat) return "Date must be in the format DD/MM/YYYY.";

  bool hasInvalidValues = dateElems[0] > 31 || dateElems[1] > 12;
  if (hasInvalidValues) return "Date must not contain invalid values.";

  return null;
}

String notEmptyValidator(String value) {
  if (value == "") return "Field must not be empty.";
  return null;
}

class _CreateConferenceScreenState extends State<CreateConferenceScreen> {
  final _home;

  _CreateConferenceScreenState(this._home);

  final _picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();

  Column generateDescriptionColumn(ConferenceModel confModel) {
    return Column(
      children: [
        Container(
          child: Text("Description:", style: mediumText),
          margin: EdgeInsets.fromLTRB(20, 0, 0, 20),
        ),
        Container(
          child: Field(
              maxLines: null,
              inputType: TextInputType.multiline,
              height: 100,
              width: 360,
              padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
              onSaved: (String value) {
                confModel.description = value;
              }),
          margin: EdgeInsets.fromLTRB(30, 0, 24, 20),
        )
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  Row generateImageRow(ConferenceModel confModel) {
    return Row(
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
            child: confModel.img == null
                ? Image.asset(
                    "assets/icons/1x/plus_icon.png",
                    scale: 30,
                  )
                : Image.file(
                    confModel.img,
                    scale: 10,
                  ),
            margin: EdgeInsets.fromLTRB(100, 35, 0, 0),
          ),
          onTap: () => letUserPickImage(confModel),
        ),
      ],
      crossAxisAlignment: CrossAxisAlignment.center,
    );
  }

  Row generateGenericLabelFieldPair(String label, ConferenceModel confModel) {
    String leftElemText = capitalizeFirstLetter(label) + ":";

    Function onSavedFunction;
    String hintText = "";
    int maxSizeInput = 200;
    Function valFunc = notEmptyValidator;
    TextInputType inputType = TextInputType.text;
    double _width = 283;

    switch (leftElemText) {
      case "Title:":
        {
          onSavedFunction = (String value) => confModel.title = value;
          hintText = "Insert the title here";
          maxSizeInput = 30;
          break;
        }
      case "Date:":
        {
          maxSizeInput = 10;
          onSavedFunction = (String value) {
            List<String> dateElems = value.split("/");
            confModel.date = DateTime(int.parse(dateElems.last),
                int.parse(dateElems[1]), int.parse(dateElems[0]));
          };
          valFunc = dateValidator;
          hintText = "Insert the date here";
          inputType = TextInputType.datetime;
          break;
        }
      case "Place:":
        {
          onSavedFunction = (String value) => confModel.place = value;
          hintText = "Insert the place here";
          _width = 273;
          break;
        }
      case "Speakers:":
        {
          //TODO: what to do with speakers
          onSavedFunction = (String value) => confModel.speakers = value;
          hintText = "Insert the speakers here";
          _width = 238;
          break;
        }
      case "Tag:":
        {
          onSavedFunction = (String value) => confModel.tag = value;
          hintText = "Insert the tag here";
          _width = 290;
          break;
        }

      default:
        print("Invalid value for leftElemText!");
    }

    Field field = Field(
      onSaved: onSavedFunction,
      width: _width,
      hintTxt: hintText,
      padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
      validator: valFunc,
      maxSizeInput: maxSizeInput,
      inputType: inputType,
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

  Container generateSubmitButton(ConferenceModel confModel) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.symmetric(horizontal: 60),
      child: FlatButton(
        onPressed: () async {
          if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
            confModel.rate = 0;
            confModel.confSetup();
            _home.revertToPrevScreen();
          }
        },
        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          "Submit",
          style: submitTextWhite,
        ),
        color: Colors.orangeAccent,
        /* style: ElevatedButton.styleFrom(
          primary: Colors.orangeAccent,
        ), */
      ),
    );
  }

  Column generateHeader() {
    return Column(
      children: [
        Container(
          child: Text(
            "Create Conference",
            style: bigText,
          ),
          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
        ),
        Container(
          child: Text(
            "Create here a post for the conference",
            style: smallerText,
          ),
          margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
        )
      ],
      crossAxisAlignment: CrossAxisAlignment.center,
    );
  }

  Future letUserPickImage(ConferenceModel confModel) async {
    final image = await _picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (image != null)
        confModel.img = File(image.path);
      else
        print("No image selected!");
    });
  }

  @override
  Widget build(BuildContext context) {
    ConferenceModel confModel = new ConferenceModel();
    List<Widget> listViewElems = [
      SizedBox(height: 40),
      generateHeader(),
      SizedBox(height: 10),
      generateGenericLabelFieldPair("title", confModel),
      SizedBox(height: 30),
      generateGenericLabelFieldPair("date", confModel),
      SizedBox(height: 30),
      generateGenericLabelFieldPair("place", confModel),
      SizedBox(height: 30),
      generateGenericLabelFieldPair("speakers", confModel),
      SizedBox(height: 30),
      generateGenericLabelFieldPair("tag", confModel),
      SizedBox(height: 30),
      generateDescriptionColumn(confModel),
      generateImageRow(confModel),
      generateSubmitButton(confModel),
      SizedBox(height: 40),
    ];

    return Scaffold(
      body: Form(
        child: ListView(
          children: listViewElems,
        ),
        key: _formKey,
      ),
    );
  }
}
