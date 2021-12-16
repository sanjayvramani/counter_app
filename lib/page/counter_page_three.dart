import 'package:counter_app/common_widget/elevated_button_widget.dart';
import 'package:counter_app/menu_mobx/bottom_menu_mobx.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CounterPageThree extends StatefulWidget {
  const CounterPageThree({Key? key, required this.bottomMenuMobx})
      : super(key: key);
  final BottomMenuMobx bottomMenuMobx;

  @override
  _CounterPageThreeState createState() => _CounterPageThreeState();
}

class _CounterPageThreeState extends State<CounterPageThree> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.bottomMenuMobx.listenToFirebaseValues();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Observer(builder: (context) {
            return Text("Counter ${widget.bottomMenuMobx.counter3}");
          }),
          ElevatedButtonWidget(bottomMenuMobx: widget.bottomMenuMobx)
        ],
      ),
    );
  }
}
