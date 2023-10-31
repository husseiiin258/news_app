import 'package:flutter/material.dart';
import 'package:news_app/network_layer/api_manager.dart';
import 'package:news_app/source_item.dart';
import 'package:news_app/sources_model.dart';

import 'news_card_item.dart';

class TabControllerWidget extends StatefulWidget {
  List<Sources> sources;
  TabControllerWidget(this.sources);

  @override
  State<TabControllerWidget> createState() => _TabControllerWidgetState();
}

class _TabControllerWidgetState extends State<TabControllerWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        margin: EdgeInsets.only(top: 10, bottom: 10),
        child: Column(
          children: [
            DefaultTabController(
                length: widget.sources.length,
                child: TabBar(
                  isScrollable: true,
                  indicatorColor: Colors.transparent,
                  onTap: (index) {
                    selectedIndex = index;
                    setState(() {});
                  },
                  tabs: widget.sources
                      .map((source) => Tab(
                            child: SourceItem(
                                source,
                                widget.sources.indexOf(source) ==
                                    selectedIndex),
                          ))
                      .toList(),
                )),
            FutureBuilder(
              future: ApiManager.getNewsDate(
                  widget.sources[selectedIndex].id ?? ""),
              builder: (context, snapshot) {
                if(snapshot.connectionState==ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator());
                }

                if(snapshot.hasError) {
                  return Center(child: Text("Something went Wrong"));
                }

                var newsList = snapshot.data?.articles??[];
                return Expanded(
                  child: ListView.builder(itemBuilder: (context, index) {
                    return
                      NewsCardItem(newsList[index]);
                  },itemCount: newsList.length,),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
