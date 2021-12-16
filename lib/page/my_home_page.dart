import 'package:counter_app/menu_mobx/bottom_menu_mobx.dart';
import 'package:counter_app/page/counter_page_one.dart';
import 'package:counter_app/page/counter_page_three.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'counter_page_two.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final BottomMenuMobx _bottomMenuMobx = BottomMenuMobx()
    ..listenToFirebaseValues();

  _pageChanged(int index) {
    _bottomMenuMobx.changeSelection(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () {
                _bottomMenuMobx.resetAll();
              },
              icon: const Icon(Icons.clear))
        ],
      ),
      body: Container(
        child: Observer(
          builder: (context) {
            if (_bottomMenuMobx.selectedMenu == 0) {
              return CounterPageOne(
                bottomMenuMobx: _bottomMenuMobx,
              );
            } else if (_bottomMenuMobx.selectedMenu == 1) {
              return CounterPageTwo(
                bottomMenuMobx: _bottomMenuMobx,
              );
            }

            return CounterPageThree(
              bottomMenuMobx: _bottomMenuMobx,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _bottomMenuMobx.incrementCounter();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: Observer(
        builder: (context) {
          return BottomNavigationBar(
            currentIndex: _bottomMenuMobx.selectedMenu,
            onTap: _pageChanged,
            elevation: 5,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: "Counter 1"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: "Counter 2"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: "Counter 3"),
            ],
          );
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
