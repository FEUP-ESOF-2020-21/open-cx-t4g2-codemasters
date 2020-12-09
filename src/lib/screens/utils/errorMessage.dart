import 'package:ESOF/style.dart';
import 'package:flutter/cupertino.dart';

class ErrorMessage extends StatelessWidget {
  final String _message;

  ErrorMessage(this._message);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(_message),
    );
  }
}
