import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/home/custom_drawer.dart';
import 'package:news_app/model/news_details_view.dart';

import '../model/category_item.dart';
import '../model/category_model.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = 'home';


  HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  List<CategoryModel> categories = [
    CategoryModel(
        CategoryId: "sports",
        CategoryTitle: "Sports",
        CategoryImage: "assets/images/sports.png",
        CategoryColor: Color(0xffC91C22)),
    CategoryModel(
        CategoryId: "politics",
        CategoryTitle: "Politics",
        CategoryImage: "assets/images/Politics.png",
        CategoryColor: Color(0xff003E90)),
    CategoryModel(
        CategoryId: "health",
        CategoryTitle: "Health",
        CategoryImage: "assets/images/health.png",
        CategoryColor: Color(0xffED1E79)),
    CategoryModel(
        CategoryId: "business",
        CategoryTitle: "Business",
        CategoryImage: "assets/images/bussines.png",
        CategoryColor: Color(0xffCF7E48)),
    CategoryModel(
        CategoryId: "environment",
        CategoryTitle: "Environment",
        CategoryImage: "assets/images/environment.png",
        CategoryColor: Color(0xff4882CF)),
    CategoryModel(
        CategoryId: "science",
        CategoryTitle: "Science",
        CategoryImage: "assets/images/science.png",
        CategoryColor: Color(0xffF2D352)),
  ];

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
              fit: BoxFit.cover)),
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
            title: Text(selectedCategory==null ?
            "News App" : selectedCategory!.CategoryTitle,
              style: GoogleFonts.exo(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 22),
            ),
            backgroundColor: Color(0xff39A552),
          ),
        ),
        drawer: CustomDrawer(onCategoryClicked:onDrawerCategoryClicked ),
        body: selectedCategory==null ?
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 25, top: 30),
              child: Text(
                "Pick your category \nof interest",
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff4F5A69),
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(30),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 5 /7),
                itemBuilder: (context, index) => CategoryItem(
                  onItemClick: onCategoryItemClick,
                  index: index,
                  categoryModel: categories[index],
                ),
                itemCount: categories.length,
              ),
            ),
          ],
        )
            :
      NewsDetailsView(categoryModel: selectedCategory! , catId: selectedCategory!.CategoryId, )
      ),
    );
  }

  CategoryModel? selectedCategory;

  onCategoryItemClick(CategoryModel categoryModel){
    print(categoryModel.CategoryId);
    selectedCategory= categoryModel;

    setState(() {

    });
  }

  onDrawerCategoryClicked(){
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {

    });
  }
}
