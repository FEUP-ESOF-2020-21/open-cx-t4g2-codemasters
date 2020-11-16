import 'package:flutter/material.dart';

import '../../style.dart';

class CounterCountainer extends StatelessWidget {
  final String attribute;
  final int counter;
  CounterCountainer(this.attribute, this.counter);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 98,
      padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        color: accentGrey,
      ),
      child: Column(
        children: [
          Text(
            this.counter.toString(),
            textAlign: TextAlign.center,
            style: profileContainerNumber,
          ),
          SizedBox(height: 5.0),
          Text(
            this.attribute,
            textAlign: TextAlign.center,
            style: profileContainerText,
          ),
        ],
      ),
    );
  }
}
