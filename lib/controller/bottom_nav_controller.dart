import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:newsapp/view/category.dart';
import 'package:newsapp/view/home_screen.dart';
import 'package:newsapp/view/search_screen.dart';

class BottomNavController extends ChangeNotifier{

  int selectindex=0;

  void  onItemTap(index){
    selectindex=index;
    notifyListeners();
  }
  List<Widget> myPages=[HomeScreen(),CategoryScreen(),SearchScreen()];
}