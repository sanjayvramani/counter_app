import 'package:mobx/mobx.dart';

part 'bottom_menu_mobx.g.dart';

class BottomMenuMobx = _BottomMenuMobx with _$BottomMenuMobx;

abstract class _BottomMenuMobx with Store
{
  @observable
  int selectedMenu = 0;

  @action
  void changeSelection(int value)
  {
    selectedMenu = value;
  }
}
