import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  final int rating;

  RatingStars(this.rating);

  @override
  Widget build(BuildContext context) {
    String starsYellow = '';
    String starsWhite = '';
    print(rating);
    for (int i = 0; i < rating; i++) {
      starsYellow += '⭐ ';
    }
    for (int i = 0; i < 5 - rating; i++) {
      starsWhite += '☆ ';
    }
    starsYellow.trim();
    starsWhite.trim();
    return Row(
      children: [
        Text(
          starsYellow,
          textScaleFactor: 1.2,
        ),
        Text(
          starsWhite,
          textScaleFactor: 1.5,
        )
      ],
    );
  }
}
