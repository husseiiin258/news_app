import 'package:flutter/material.dart';
import 'package:news_app/sources_model.dart';

class SourceItem extends StatelessWidget {
  Sources sources ;
  bool selected ;

  SourceItem(this.sources , this.selected);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12 , vertical: 8),
      decoration: BoxDecoration(
        color: selected?Color(0xff39A552) : Colors.transparent,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Color(0xff39A552),

        )
      ),
      child: Text(sources.name??"" , style: TextStyle(
        color: selected? Colors.white : Color(0xff39A552)
      ),),
    );
  }
}
