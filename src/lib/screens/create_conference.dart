import 'dart:io';

import 'package:ESOF/model/conference.dart';
import 'package:ESOF/screens/utils/button.dart';
import 'package:ESOF/screens/utils/counter.dart';
import 'package:ESOF/screens/utils/field.dart';
import 'package:ESOF/screens/utils/string_fomatting.dart';
import 'package:ESOF/style.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ESOF/model/conferenceModel.dart';
import 'package:ESOF/widgets/profile/profile_photo.dart';

String dateValidator(String value) {
  if (value.length == 0) return "Field must not be empty";

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

String tagValidator(String value) {
  if (value == "") return "Field must not be empty.";
  List<String> separatedTags = value.split(new RegExp(r'; |, |\*|\n| '));
  RegExp tag = RegExp(r'#.*');
  bool warningMsg = false;
  print(separatedTags);
  separatedTags.forEach((element) {
    if (!tag.hasMatch(element)) warningMsg = true;
  });

  if (warningMsg || separatedTags.length == 0)
    return "Tags must start with a #";
  return null;
}

String notEmptyValidator(String value) {
  if (value == "") return "Field must not be empty.";
  return null;
}

class CreateConferenceScreen extends StatefulWidget {
  final _home;
  final _conf;

  CreateConferenceScreen(this._home, this._conf);

  @override
  _CreateConferenceScreenState createState() =>
      _CreateConferenceScreenState(_home, _conf);
}

class _CreateConferenceScreenState extends State<CreateConferenceScreen> {
  final _home;
  final _formKey = GlobalKey<FormState>();
  final _picker = ImagePicker();
  Counter counter;
  final Conference _conf;

  String _speakers = "";
  String _tempSpeakers = "";
  File _image;

  _CreateConferenceScreenState(this._home, this._conf);

  Column generateDescriptionColumn(ConferenceModel confModel) {
    return Column(
      children: [
        Container(
          child: Text("Description:", style: mediumText),
          margin: EdgeInsets.fromLTRB(20, 0, 0, 20),
        ),
        Container(
          child: Field(
            initialValue: this._conf == null ? "" : this._conf.description,
            maxLines: null,
            inputType: TextInputType.multiline,
            height: 100,
            width: 360,
            padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
            onSaved: (String value) {
              confModel.description = value;
            },
            validator: (String value) {
              _formKey.currentState.save();
            },
          ),
          margin: EdgeInsets.fromLTRB(30, 0, 24, 20),
        )
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  Row generateImageRow(ConferenceModel confModel) {
    if (_conf != null) _image = _conf.photo;
    return Row(children: [
      GestureDetector(
        child: Container(
            child: _image == null
                ? ProfilePhoto('assets/images/conference_test.jpg')
                : ProfilePhotoFile(_image)),
        onTap: () => letUserPickImage(confModel),
      )
    ], mainAxisAlignment: MainAxisAlignment.center);
  }

  Future letUserPickImage(ConferenceModel confModel) async {
    final image = await _picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (image != null) {
        _image = File(image.path);
      } else
        print("No image selected!");
    });
  }

  Row generateGenericLabelFieldPair(String label, ConferenceModel confModel) {
    String leftElemText = capitalizeFirstLetter(label) + ":";

    Function onSavedFunction;
    String hintText = "";
    int maxSizeInput = 200;
    Function valFunc = notEmptyValidator;
    TextInputType inputType = TextInputType.text;
    double _width = 233;
    String initialValue = "";

    switch (leftElemText) {
      case "Title:":
        {
          /// Not arrow function, since arrow function returns a value.
          onSavedFunction = (String value) {
            confModel.title = value;
          };
          if (this._conf != null) initialValue = this._conf.title;
          hintText = "Insert the title here";
          maxSizeInput = 30;
          break;
        }
      case "Date:":
        {
          maxSizeInput = 10;
          onSavedFunction = (String value) {
            if (value.length != 0) {
              List<String> dateElems = value.split("/");
              confModel.date = DateTime(int.parse(dateElems.last),
                  int.parse(dateElems[1]), int.parse(dateElems[0]));
            }
          };
          if (this._conf != null) {
            var dateTimeDate = this._conf.date;
            initialValue =
                "${dateTimeDate.day.toString()}/${dateTimeDate.month.toString()}/${dateTimeDate.year.toString()}";
          }
          valFunc = dateValidator;
          hintText = "Insert the date here";
          inputType = TextInputType.datetime;
          break;
        }
      case "Place:":
        {
          onSavedFunction = (String value) {
            confModel.place = value;
          };
          if (this._conf != null) initialValue = this._conf.place;
          hintText = "Insert the place here";
          break;
        }
      case "Tag:":
        {
          onSavedFunction = (String value) {
            confModel.tag = value;
          };
          if (this._conf != null) initialValue = this._conf.tag;
          valFunc = tagValidator;
          hintText = "Insert the tag here";
          break;
        }

      default:
        print("Invalid value for leftElemText!");
    }

    Field field = Field(
      initialValue: initialValue,
      onSaved: onSavedFunction,
      width: _width,
      hintTxt: hintText,
      padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
      validator: (String value) {
        String validation = valFunc(value);
        //print(validation);
        if (validation != null) return validation;
        _formKey.currentState.save();
      },
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
        margin: EdgeInsets.only(right: 20),
      )
    ];

    return Row(
      children: rowElems,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    );
  }

  Future<List<String>> getSpeakers() async {
    var speakers = await _conf.getSpeakers();
    var speakerUsernames = speakers.map((speaker) => speaker.username).toList();
    return speakerUsernames;
  }

  // Function to insert the speaker username.
  Row generateSpeakerRow() {
    final _speakerFormKey = GlobalKey<FormState>();

    var futureCounter;
    if (_conf != null)
      futureCounter = FutureBuilder<List<String>>(
        future: getSpeakers(),
        builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
          if (snapshot.hasData) {
            var snapshotData = snapshot.data;
            int count = snapshotData.length;
            counter = Counter(count);
            this._speakers = snapshotData.join(",");
            return counter;
          } else if (snapshot.hasError) {
            return Text("Couldn't get speakers!");
          } else
            return SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(),
            );
        },
      );
    else {
      counter = Counter(0);
      futureCounter = counter;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Text(
            "Speakers:",
            style: mediumText,
          ),
          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        ),
        futureCounter,
        Container(
          margin: EdgeInsets.only(right: 20),
          child: GestureDetector(
            child: Image.asset(
              "assets/icons/1x/plus_icon.png",
              scale: 30,
            ),
            onTap: () => showDialog(
              context: context,
              child: SimpleDialog(
                title: Text("Insert the speaker's username:"),
                children: [
                  SizedBox(height: 20),
                  Form(
                    key: _speakerFormKey,
                    child: Field(
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 10),
                      onSaved: (value) {
                        this._tempSpeakers == ""
                            ? this._tempSpeakers = value
                            : this._tempSpeakers += "," + value;
                      },
                      validator: (value) {
                        final validation = notEmptyValidator(value);
                        if (validation != null) return validation;
                        //_formKey.currentState.save();
                      },
                    ),
                  ),
                  Container(
                    child: Button(
                      buttonText: "OK",
                      onPressedFunc: () {
                        if (_speakerFormKey.currentState.validate()) {
                          _speakerFormKey.currentState.save();
                          counter.incrementCounter();
                          Navigator.pop(context);
                        }
                      },
                    ),
                    padding: EdgeInsets.all(50),
                  ),
                ],
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
              ),
            ),
          ),
        )
      ],
    );
  }

  Container generateSubmitButton(ConferenceModel confModel) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.symmetric(horizontal: 60),
      child: Button(
        buttonText: "Submit",
        onPressedFunc: () async {
          if (_formKey.currentState.validate()) {
            if (_conf == null && _home != null) {
              _formKey.currentState.save();
              confModel.rate = 0;
              confModel.speakers = _speakers + "," + _tempSpeakers;
              confModel.img = _image;
              confModel.confSetup();
              _home.revertToPrevScreen();
            } else {
              //...
              Navigator.pop(context);
            }
          }
        },
      ),
    );
  }

  Column generateHeader() {
    return Column(
      children: [
        Container(
          child: Text(
            _conf == null ? "Create Conference" : "Edit Conference",
            style: bigText,
          ),
          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
        ),
        Container(
          child: Text(
            _conf == null
                ? "Create here a post for the conference"
                : "Edit here the post for conference",
            style: smallerText,
          ),
          margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
        )
      ],
      crossAxisAlignment: CrossAxisAlignment.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    ConferenceModel confModel = new ConferenceModel();
    List<Widget> listViewElems = [
      generateHeader(),
      SizedBox(height: 20),
      generateImageRow(confModel),
      SizedBox(height: 35),
      generateSpeakerRow(),
      SizedBox(height: 40),
      generateGenericLabelFieldPair("title", confModel),
      SizedBox(height: 30),
      generateGenericLabelFieldPair("date", confModel),
      SizedBox(height: 30),
      generateGenericLabelFieldPair("place", confModel),
      SizedBox(height: 30),
      generateGenericLabelFieldPair("tag", confModel),
      SizedBox(height: 30),
      generateDescriptionColumn(confModel),
      SizedBox(height: 30),
      generateSubmitButton(confModel),
    ];

    return Scaffold(
      body: Form(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 40),
          children: listViewElems,
        ),
        key: _formKey,
      ),
    );
  }
}
