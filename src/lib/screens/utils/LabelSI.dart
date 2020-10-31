import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../style.dart';

class LabelSI extends StatelessWidget {

  final String _label;
  final EdgeInsetsGeometry _eig;
  LabelSI(this._label, this._eig);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
          _label,
          style: mediumText,
        ),
        margin: this._eig
    );
  }
}