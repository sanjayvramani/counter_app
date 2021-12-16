import 'package:firebase_database/firebase_database.dart';
import 'package:mobx/mobx.dart';

part 'bottom_menu_mobx.g.dart';

class BottomMenuMobx = _BottomMenuMobx with _$BottomMenuMobx;

abstract class _BottomMenuMobx with Store {
  @observable
  int counter1 = 0;

  @observable
  int counter2 = 0;

  @observable
  int counter3 = 0;

  @observable
  int selectedMenu = 0;

  @action
  increment() {
    switch (selectedMenu) {
      case 0:
        counter1++;
        break;
      case 1:
        counter2++;
        break;
      case 2:
        counter3++;
        break;
    }
  }

  @action
  void changeSelection(int value) {
    selectedMenu = value;
  }

  DatabaseReference? _databaseReference;
  @action
  void listenToFirebaseValues() {
    _databaseReference = FirebaseDatabase.instance.ref().child(_getPageName());
    _databaseReference!.onChildAdded.listen(readChange);
    _databaseReference!.onChildChanged.listen(readChange);
  }

  String _getPageName() {
    if (selectedMenu == 0) {
      return "page1";
    } else if (selectedMenu == 1) {
      return "page2";
    }
    return "page3";
  }

  String key = "";

  readChange(DatabaseEvent event) {
    var datasnapShot = event.snapshot;
    Map<dynamic, dynamic>? map = datasnapShot.value as Map?;
    key = map!["key"] ?? "";
    if (selectedMenu == 0) {
      counter1 = map["value"] ?? 0;
    } else if (selectedMenu == 1) {
      counter2 = map["value"] ?? 0;
    } else if (selectedMenu == 2) {
      counter3 = map["value"] ?? 0;
    }
  }

  incrementCounter() {
    if (key == "") {
      key = _databaseReference!.push().key.toString();
    }

    var map = {"key": key, "value": getValue()};
    _databaseReference!.child(key).set(map);
  }

  int getValue() {
    if (selectedMenu == 0) {
      return ++counter1;
    } else if (selectedMenu == 1) {
      return ++counter2;
    }
    return ++counter3;
  }

  resetAll() {
    counter1 = counter2 = counter3 = 0;
    final databaseReference = FirebaseDatabase.instance.ref();
    databaseReference.remove();
  }
}
