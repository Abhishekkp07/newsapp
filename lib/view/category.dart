import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newsapp/view/widgets/newscard.dart';

import 'package:provider/provider.dart';

import '../controller/catagory_controller.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen > createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen > {
  void fetchData() async {
    Provider.of<CategoryController>(context, listen: false).fetchData();
  }

  @override
  void initState() {
    fetchData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CategoryController provider = Provider.of<CategoryController>(context);
    return DefaultTabController(
      length: provider.categorylist.length,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          titleTextStyle: const TextStyle(
              color: Color(0xff6A3DE8),
              fontSize: 20,
              fontWeight: FontWeight.w600),
          title: const Text("Categories"),
          bottom: TabBar(
            labelStyle: const TextStyle(
                color: Color(0xff6A3DE8), fontWeight: FontWeight.w600),
            labelColor: Colors.white,
            unselectedLabelColor: Color(0xff6A3DE8),
            indicatorPadding: EdgeInsets.symmetric(horizontal: 5),
            unselectedLabelStyle: const TextStyle(
                color: Color(0xff6A3DE8),
                fontSize: 15,
                fontWeight: FontWeight.w500),
            overlayColor: MaterialStatePropertyAll(Colors.grey),
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
                color: Color(0xff6A3DE8),
                borderRadius: BorderRadius.circular(10)),
            isScrollable: true,
            tabs: List.generate(
              provider.categorylist.length,
                  (index) => Tab(
                text: provider.categorylist[index],
              ),
            ),
            onTap: (value) {
              provider.onTap(index: value);
            },
          ),
        ),
        body: provider.isLoading == true
            ? Center(
            child: LottieBuilder.asset(
              "assest/animation/loading.json",
              fit: BoxFit.cover,
              height: 75,
              width: 75,
            ))
            : Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.separated(
              itemBuilder: (context, index) => NewsCard(
                title: provider.newsmodel.articles?[index].title
                    .toString() ??
                    "",
                description: provider
                    .newsmodel.articles?[index].description
                    .toString() ??
                    "",
                date: provider.newsmodel.articles?[index].publishedAt,
                imageUrl: provider
                    .newsmodel.articles?[index].urlToImage
                    .toString() ??
                    "",
                contant: provider.newsmodel.articles?[index].content
                    .toString() ??
                    "",
                sourceName: provider
                    .newsmodel.articles?[index].source?.name
                    .toString() ??
                    "",
                url: provider.newsmodel.articles?[index].url
                    .toString() ??
                    "",
              ),
              separatorBuilder: (context, index) => const Divider(
                height: 20,
              ),
              itemCount: provider.newsmodel.articles?.length ?? 0),
        ),
      ),
    );
  }
}

