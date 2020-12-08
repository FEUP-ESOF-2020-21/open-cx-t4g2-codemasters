import 'package:ESOF/style.dart';
import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  _CounterState _state;

  int _counter;

  Counter(this._counter);

  incrementCounter() {
    _counter++;
    _state.incrementCounter();
  }

  set counter(int counter) {
    _counter = counter;
    _state.counter = counter;
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

  set counter(int counter) {
    setState(() {
      _counter = counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: Text(_counter.toString(), style: bigText));
  }
}
