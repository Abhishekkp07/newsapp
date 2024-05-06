import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:flutter/cupertino.dart';
import 'package:newsapp/model/newsmodel.dart';

class CategoryController extends ChangeNotifier{
  List<String> categorylist=["business","entertainment","general","health","science","sports","technology"];

  String category="business";

  onTap({required int index}){
    category=categorylist[index].toLowerCase();
    fetchData();
    print(category);
    notifyListeners();
  }

  late Newsmodel newsmodel;
  bool isLoading=false;

  void fetchData() async{
    isLoading=true;
    notifyListeners();
    final url=Uri.parse("https://newsapi.org/v2/top-headlines?country=de&category=business&apiKey=b04c6d5c8c29420096941fd84a554cf1");
    print(category);
    final response =await http.get(url);
    print(response.statusCode);
    Map<String ,dynamic> decodedData={};

    if(response.statusCode==200){
      decodedData=jsonDecode(response.body);
    }else{
      print("Api failed");
    }
    newsmodel= Newsmodel.fromJson(decodedData);
    isLoading =false;
    notifyListeners();

  }
}