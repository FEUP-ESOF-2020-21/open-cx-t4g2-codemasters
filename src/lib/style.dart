import 'package:flutter/material.dart';

const TextStyle smallerText = TextStyle(
  color: Colors.black,
  fontSize: 13,
  fontWeight: FontWeight.w400,
  letterSpacing: 1.1,
);

const TextStyle mediumText = TextStyle(
  color: Colors.black,
  fontSize: 18,
  fontWeight: FontWeight.w500,
  letterSpacing: 1.3,
);

const TextStyle bigText = TextStyle(
  color: Colors.black,
  fontSize: 35,
  fontWeight: FontWeight.bold,
  letterSpacing: 1.5,
  shadows: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 4.0,
      offset: Offset(1.5, 1.5),
    ),
  ],
);

const TextStyle hintText = TextStyle(
  color: Colors.black,
  fontSize: 16,
  fontWeight: FontWeight.w400,
  letterSpacing: 1.1,
);

const Color accentOrange = Color(0xFFF27403);

const Color accentGrey = Color(0xFFC4C4C4);

final BoxDecoration inputBoxDecoration = BoxDecoration(
  color: accentGrey,
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);
