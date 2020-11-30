import 'package:ESOF/screens/utils/field.dart';
import 'package:ESOF/style.dart';
import 'package:flutter/material.dart';

class AddCommentScreen extends StatefulWidget {
  @override
  _AddCommentScreenState createState() => _AddCommentScreenState();
}

class _AddCommentScreenState extends State<AddCommentScreen> {
  final _formKey = GlobalKey<FormState>();
  String comment = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 250),
        children: [
          Column(
            children: [
              Text(
                'Comment:',
                style: bigText,
              ),
              SizedBox(height: 50),
              Field(
                height: 90,
                hintTxt: "\nComment",
                icon: Icon(Icons.comment, color: Colors.black54),
                maxLines: 20,
                validator: (String value) {
                  _formKey.currentState.save();
                },
                onSaved: (String value) {
                  print(value);
                  comment = value;
                },
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: Colors.orangeAccent,
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        print('Leave Comment');
                        print(comment);
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text(
                      'Leave Comment',
                      style: submitTextWhite,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
