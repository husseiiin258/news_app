import 'package:flutter/material.dart';
import 'package:news_app/settings/selected_language.dart';
import 'package:news_app/settings/unselected_language.dart';

import 'package:provider/provider.dart';

import '../app_provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var appProvider = Provider.of<AppProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Color(0xff39A552),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
              onTap: () {
                appProvider.changeLanguage("en");
                Navigator.pop(context);
              },
              child: appProvider.currentLocale == "en"
                  ? SelectedOption(selectedTitle: "English")
                  : UnSelectedOption(unSelectedtitle: "English")),
          SizedBox(
            height: 40,
          ),
          GestureDetector(
              onTap: () {
                appProvider.changeLanguage("ar");
                Navigator.pop(context);
              },
              child: appProvider.currentLocale == "ar"
                  ? SelectedOption(selectedTitle: "العربية")
                  : UnSelectedOption(unSelectedtitle: "العربية"))
        ],
      ),
    );
  }
}
