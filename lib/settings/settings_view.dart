

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
      ),
    );
  }

  allCategories(){

    Navigator.pop(context);
    Navigator.pushNamed(context, HomeLayout.routeName);
  }
}