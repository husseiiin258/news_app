

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/home/home_layout.dart';

import '../home/custom_drawer.dart';


class SettingsView extends StatefulWidget {
  static const String routeName = "settings";

  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    return Container(
        height: mediaQuery.height,
        width: mediaQuery.width,
        decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
        image: AssetImage("assets/images/pattern.png"),
    fit: BoxFit.cover) , ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(75),
          child: AppBar(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                )),
            elevation: 0,
            centerTitle: true,
            title: Text("Settings",
              style: GoogleFonts.exo(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 22),
            ),
            backgroundColor: Color(0xff39A552),
          ),
        ),
        drawer: CustomDrawer(onCategoryClicked:allCategories ),
        body: Container(
          margin: EdgeInsets.only(left: 20 , top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                "Language", style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.bold
                ),
                ),
              ),
              GestureDetector(
                onTap: (){},
                child: Container(

                  height: 50,
                  width: mediaQuery.width,
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: Color(0xff39A552), width: 1.5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                     "English", style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        color: Color(0xff39A552),
                      ),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: Color(0xff39A552),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  allCategories(){

    Navigator.pop(context);
    Navigator.pushNamed(context, HomeLayout.routeName);
  }
}