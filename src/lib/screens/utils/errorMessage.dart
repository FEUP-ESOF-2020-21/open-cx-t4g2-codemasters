import 'package:flutter/cupertino.dart';

class errorMessage extends StatefulWidget{
  var _state = _errorMessageState("");
  String _textError = "";


  void setText(newText){
    _textError = newText;
    _state.setText(_textError);
  }

  @override
  _errorMessageState createState(){
    return this._state = new _errorMessageState(_textError);
  }


}
class _errorMessageState extends State<errorMessage>{
  String _textError;

  _errorMessageState(this._textError);

  @override
  Widget build(BuildContext context) {
    return _textError == null || _textError.isEmpty ? SizedBox.shrink(): Text(
      _textError,
    );
  }

  void setText(String message){
    setState(() {
      _textError = message;
    });

  }

}