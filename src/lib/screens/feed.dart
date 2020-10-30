import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import "../style.dart";
import '../ui_elements.dart';
import '../widgets/feed/recommended_carousel.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    Scaffold scaffold = Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            SizedBox(height: 20.0),
            RecommendedCarousel(),
            SizedBox(height: 20.0),
            //TopRatedCarousel(),
            RecommendedCarousel(),
            SizedBox(height: 20.0),
            //ComingNextCarousel(),
            RecommendedCarousel(),
          ],
        ),
      ),
      resizeToAvoidBottomPadding: false,
      appBar: appBar,
      bottomNavigationBar: navigationBar,
    );
    return scaffold;
  }
}
