// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bottom_menu_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BottomMenuMobx on _BottomMenuMobx, Store {
  final _$counter1Atom = Atom(name: '_BottomMenuMobx.counter1');

  @override
  int get counter1 {
    _$counter1Atom.reportRead();
    return super.counter1;
  }

  @override
  set counter1(int value) {
    _$counter1Atom.reportWrite(value, super.counter1, () {
      super.counter1 = value;
    });
  }

  final _$counter2Atom = Atom(name: '_BottomMenuMobx.counter2');

  @override
  int get counter2 {
    _$counter2Atom.reportRead();
    return super.counter2;
  }

  @override
  set counter2(int value) {
    _$counter2Atom.reportWrite(value, super.counter2, () {
      super.counter2 = value;
    });
  }

  final _$counter3Atom = Atom(name: '_BottomMenuMobx.counter3');

  @override
  int get counter3 {
    _$counter3Atom.reportRead();
    return super.counter3;
  }

  @override
  set counter3(int value) {
    _$counter3Atom.reportWrite(value, super.counter3, () {
      super.counter3 = value;
    });
  }

  final _$selectedMenuAtom = Atom(name: '_BottomMenuMobx.selectedMenu');

  @override
  int get selectedMenu {
    _$selectedMenuAtom.reportRead();
    return super.selectedMenu;
  }

  @override
  set selectedMenu(int value) {
    _$selectedMenuAtom.reportWrite(value, super.selectedMenu, () {
      super.selectedMenu = value;
    });
  }

  final _$_BottomMenuMobxActionController =
      ActionController(name: '_BottomMenuMobx');

  @override
  dynamic increment() {
    final _$actionInfo = _$_BottomMenuMobxActionController.startAction(
        name: '_BottomMenuMobx.increment');
    try {
      return super.increment();
    } finally {
      _$_BottomMenuMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSelection(int value) {
    final _$actionInfo = _$_BottomMenuMobxActionController.startAction(
        name: '_BottomMenuMobx.changeSelection');
    try {
      return super.changeSelection(value);
    } finally {
      _$_BottomMenuMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void listenToFirebaseValues() {
    final _$actionInfo = _$_BottomMenuMobxActionController.startAction(
        name: '_BottomMenuMobx.listenToFirebaseValues');
    try {
      return super.listenToFirebaseValues();
    } finally {
      _$_BottomMenuMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
counter1: ${counter1},
counter2: ${counter2},
counter3: ${counter3},
selectedMenu: ${selectedMenu}
    ''';
  }
}
