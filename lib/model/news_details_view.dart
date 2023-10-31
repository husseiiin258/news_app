import 'package:news_app/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:news_app/network_layer/api_manager.dart';

import '../tab_controller.dart';

class NewsDetailsView extends StatelessWidget {
  String catId ;

  final CategoryModel categoryModel;
   NewsDetailsView({required this.categoryModel ,required this.catId});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: mediaQuery.height,
        width: mediaQuery.width,
        decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage("assets/images/pattern.png"),
                fit: BoxFit.cover)),
        child: FutureBuilder(future: ApiManager.getSources(catId), builder: (context , snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }

          if(snapshot.hasError) {
            return Center(child: Text("Something went Wrong"));
          }


          var sourcesList = snapshot.data?.sources??[];
          return
            TabControllerWidget(sourcesList);
        }),),
    );
  }
}
