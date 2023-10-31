import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/home/home_layout.dart';
import 'package:news_app/settings/settings_view.dart';
import 'package:news_app/splash_screen.dart';
import 'package:provider/provider.dart';

import '../app_provider.dart';

class CustomDrawer extends StatelessWidget {
  final Function onCategoryClicked ;
  const CustomDrawer({required this.onCategoryClicked});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var appProvider = Provider.of<AppProvider>(context);
    return Container(
      width: mediaQuery.width*0.7,
      color: Colors.white,
      child: Column(

        children: [
          Container(
            alignment: Alignment.center,
            width: mediaQuery.width*0.7,
            height: mediaQuery.height*0.15,
            color: Color(0xff39A552),
            child: Text(appProvider.currentLocale=="en" ?"News App" : "الأخبار", style:GoogleFonts.exo(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 22
            ),),
          ),
          GestureDetector(
            onTap: (){
              onCategoryClicked();
            },
            child: Container(
              margin: EdgeInsets.only(top: 25 , bottom: 25 , left: 10),
              child: Row(
                children: [
                  Icon(Icons.menu , size: 38,),
                  Text(appProvider.currentLocale=="en" ?"  Categories": "الفئات" , style:GoogleFonts.exo(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24
                  ),),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, SettingsView.routeName);

            },
            child: Container(
              margin: EdgeInsets.only( left: 10),
              child: Row(
                children: [
                  Icon(Icons.settings , size: 38,),
                  Text(appProvider.currentLocale=="en" ?"  settings" :"الأعدادات", style:GoogleFonts.exo(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24
                  ),),
                ],
              ),
            ),
          )
        ],
    ),
    );
  }
}
