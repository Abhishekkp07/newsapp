import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/controller/bottom_nav_controller.dart';
import 'package:provider/provider.dart';

class Main_page extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Provider.of<BottomNavController>(context)
      .myPages[Provider.of<BottomNavController>(context).selectindex],
      bottomNavigationBar:BottomNavigationBar(
        currentIndex:Provider.of<BottomNavController>(context).selectindex ,
          onTap: (index)=>Provider.of<BottomNavController>(context,listen: false).onItemTap(index),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home,),label: ""),
           BottomNavigationBarItem(icon: Icon(Icons.category,),label: ""),
             BottomNavigationBarItem(icon: Icon(Icons.search,),label: ""),
    ],
    ));
  }

}