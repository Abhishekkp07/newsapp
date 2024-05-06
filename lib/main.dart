import 'package:flutter/material.dart';
import 'package:newsapp/controller/bottom_nav_controller.dart';
import 'package:newsapp/controller/catagory_controller.dart';
import 'package:newsapp/controller/home_controller.dart';
import 'package:newsapp/controller/search_controller.dart';
import 'package:newsapp/view/main_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( Mynewsapp(),);
}
class Mynewsapp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return MultiProvider(providers: [
     ChangeNotifierProvider(create: (context)=>HomeScreenController()),
     ChangeNotifierProvider(create: (context)=>SearchScreenController()),
     ChangeNotifierProvider(create: (context)=>CategoryController()),
     ChangeNotifierProvider(create: (context)=>BottomNavController()),
   ],child: MaterialApp(home: Main_page(),),);
  }

}
