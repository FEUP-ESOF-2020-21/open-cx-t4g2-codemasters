import 'package:ESOF/model/conference.dart';
import 'package:ESOF/screens/login.dart';
import 'package:ESOF/screens/feed.dart';
import 'package:ESOF/screens/signup.dart';
import 'package:flutter/material.dart';
import 'model/speaker.dart';
import "screens/post.dart";

import 'screens/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: PostScreen(Conference(
            "assets/images/conference_test.jpg",
            "Random Title",
            DateTime(2020),
            "Porto",
            "afasfafafafafafafafafafadsfdsafasdfaf asffadsfegesgadsgwefsgdfasfdfgsafrfgdefrgsrtfgghsfrtgghdrthdrtyhdrthrhfrgfhfgghfdgghfdgsgdefasfgagdfgadffafdfgadfsfadsfdsfafdsadfagdfgadgdfasgdfasggsdfaggsdfgsfdgfedsgsfdgsdfgdfsgdsfgsdfgdfsgsdfgsdfgsdfgsfdgsdfgdfsgsdfggsdfgsdfgdfsgsdfgsfdgdfsgsdfegsdfgsdfgsdffgsdfgsdefgsdfgsdfgsdfegsdfggsefdgsdfgsdfgsdfgdfsrgsdfgdfgsdfgdioujfhnndfsiuhdsfiughdfiufhdfisuhfdiufhiaudffhiudfsahfiuadshfiudshfiusdhfiuadshfiudshfiuasdhfiuasddijhkfdchbnswdiujfhjaerwiufhjaewiufjhaerioufjhweiudfdhdsiufhdsiufhjsdiufjhdsiufhsadiufhadswiufhadsiufhasdiufhasdiufhasdiufhadsfhnhfiuadshfiuadshfiuahsdfiuadshfiudsahfiuadshfawefsgeasgdsfgasffafgadfffa",
            5, [
      Speaker("Armindo Vaz", 1, 1, "assets/images/default_profile_icon.jpeg"),
      Speaker("Josefino Ola", 1, 1, "assets/images/default_profile_icon.jpeg")
    ])));

    // Uncomment after finished testing
    //return MaterialApp(home: LoginScreen());
  }
}
