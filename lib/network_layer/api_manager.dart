import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news_app/constants/constants.dart';
import 'package:news_app/news_response.dart';
import 'package:news_app/sources_model.dart';

class ApiManager {
  
 static Future<SourcesModel> getSources(String catId) async{
  Uri url = Uri.https(Base_URL , "/v2/top-headlines/sources" ,
      {
        "apiKey" : apiKey ,
        "category" : catId
      });
  Response response = await http.get(url);
  var jsonData = jsonDecode(response.body);
  SourcesModel data = SourcesModel.fromJson(jsonData);
  return data ;
}


static Future<NewsResponse> getNewsDate(String sourceID) async{
   Uri url =Uri.https(Base_URL , "/v2/everything" ,
       {
         "apiKey" : apiKey ,
         "sources" : sourceID ,
       } );
   Response response = await http.get(url) ;
   var jsonDate = jsonDecode(response.body) ;
   NewsResponse newsResponse = NewsResponse.fromJson(jsonDate);

   return newsResponse;
}
}
