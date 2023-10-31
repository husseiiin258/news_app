import 'package:flutter/material.dart';
import 'package:news_app/news_response.dart';

class NewsCardItem extends StatelessWidget {
  Articles articles;
  NewsCardItem(this.articles);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: EdgeInsets.only(top: 18),
      child: Column(
        children: [
          Image.network(
            articles.urlToImage ?? "",
            fit: BoxFit.fill,
          ),
          Text(
            articles.title ?? "",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text(articles.description ?? "" ,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
          Row(
            children: [
              Expanded(child: Text(articles.author ?? "" ,    maxLines: 1,

                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),)),
              Text(articles.publishedAt?.substring(0,10) ?? "")
            ],
          )
        ],
      ),
    );
  }
}
