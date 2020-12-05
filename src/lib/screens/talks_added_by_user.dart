import 'package:ESOF/auth/Authentication.dart';
import 'package:ESOF/database/databaseService.dart';
import 'package:ESOF/model/userModel.dart';
import 'package:ESOF/style.dart';
import 'package:ESOF/widgets/common/feed_common.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TalksAddedByUserScreen extends StatelessWidget {
  List<Map<String, dynamic>> conferences = [];
  List<DocumentReference> conferencesRef = [];

  Future<void> filterConfsByUser(List<DocumentSnapshot> confs) async {
    UserModel user =
        await DatabaseService.getUser(AuthService.auth.currentUser.uid);
    confs.forEach((conf) {
      //if (conf.reference['user'] == user.ref) {
        this.conferences.add(conf.data());
        this.conferencesRef.add(conf.reference);
      //}
    });
  }

  List<Widget> drawTalks(context, List<DocumentSnapshot> confs) {
    return displayConferences(context, conferences, conferencesRef);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection("Conference").snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              filterConfsByUser(snapshot.data.documents);
              return SafeArea(
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 35.0),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Talks added by You',
                          style: bigText,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: drawTalks(context, snapshot.data.documents),
                    ),
                  ],
                ),
              );
            }
          }),
      resizeToAvoidBottomPadding: false,
    );
  }
}
