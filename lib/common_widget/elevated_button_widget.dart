import 'package:counter_app/menu_mobx/bottom_menu_mobx.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ElevatedButtonWidget extends StatefulWidget {
  const ElevatedButtonWidget({Key? key, required this.bottomMenuMobx})
      : super(key: key);
  final BottomMenuMobx bottomMenuMobx;

  @override
  _ElevatedButtonWidgetState createState() => _ElevatedButtonWidgetState();
}

class _ElevatedButtonWidgetState extends State<ElevatedButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          widget.bottomMenuMobx.incrementCounter();
        },
        child: const Text("Increment me!"));
  }
}
