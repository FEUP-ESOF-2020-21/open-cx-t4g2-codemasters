import 'package:ESOF/style.dart';
import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  var _state = _CounterState(0);

  int _counter = 0;

  incrementCounter() {
    _counter++;
    _state.incrementCounter();
  }

  @override
  _CounterState createState() {
    return this._state = new _CounterState(_counter);
  }
}

class _CounterState extends State<Counter> {
  int _counter;

  _CounterState(this._counter);

  incrementCounter() {
    setState(() {
      this._counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: Text(_counter.toString(), style: bigText));
  }
}
