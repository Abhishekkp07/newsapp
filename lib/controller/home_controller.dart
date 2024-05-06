import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/newsmodel.dart';

class HomeScreenController with ChangeNotifier {
  late Newsmodel newsModel;
  bool isLoading = false;
  //var baseUrl = "https://newsapi.org/";

  fetchData() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse("https://newsapi.org/v2/top-headlines?country=in&apiKey=49fe83b5cf85471f8bd4d35ff3f208a5");
    final response = await http.get(url);
    print(response.statusCode);
    Map<String, dynamic> decodedData = {}; // map for storing response body
    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
    } else {
      print("Api failed");
    }
    newsModel = Newsmodel.fromJson(decodedData);
    isLoading = false;
    notifyListeners();
  }

  // Function to launch a URL
  Future<void> launchURL(String url) async {
    try {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      print('Error launching URL: $e');
    }
    notifyListeners();
  }

  ///to share news
  void shareText({String textToShare = ""}) {
    try {
      Share.share(textToShare);
    } catch (e) {
      print('Error sharing: $e');
    }
    notifyListeners();
  }
}