import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class CounterPageOne extends StatefulWidget {
  CounterPageOne({Key? key}) : super(key: key);

  @override
  _CounterPageOneState createState() => _CounterPageOneState();
}

class _CounterPageOneState extends State<CounterPageOne> {
  final DatabaseReference _databaseReference =
      FirebaseDatabase.instance.reference().child("page1");
  int _currentValue = 0;
  String key = "";

  _CounterPageOneState() {
    _databaseReference.onChildAdded.listen(_readChange);
    _databaseReference.onChildChanged.listen(_readChange);
  }

  _readChange(DatabaseEvent event) {
    var datasnapShot = event.snapshot;
    Map<dynamic, dynamic>? map = datasnapShot.value as Map?;
    key = map!["key"] ?? "";
    if(mounted) {
      setState(() {
        _currentValue = map["value"] ?? 0;
      });
    }
  }
  _incrementCounter() {
    //  _currentValue = _currentValue + 1;
    if (key == "") {
      key = _databaseReference.push().key.toString();
    }
    var map = {"key": key, "value": _currentValue + 1};
    print(map);
    _databaseReference.child(key).set(map);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Counter $_currentValue"),
          ElevatedButton(
              onPressed: () {
                _incrementCounter();
              },
              child: const Text("Increment me!"))
        ],
      ),
    );
  }
}
