import 'package:flutter/material.dart';
import 'package:ordery/models/category.dart';


class CategoriesList extends StatefulWidget {
  @override
  _CategoriesListState createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  List<Category> category = [
    Category('Salad', 'assets/images/salad.png'),
    Category('Steak', 'assets/images/steak.png'),
    Category('Fish', 'assets/images/fish.png'),
    Category('Sandwich', 'assets/images/sandwich.png'),
    Category('Drink', 'assets/images/pint.png'),
    Category('Ice Cream', 'assets/images/ice-cream.png'),


  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: category.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(left: 10,right: 10 , bottom: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey[300], offset: Offset(1, 1), blurRadius: 4)
                  ]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.asset(
                    category[index].catImage,
                      width: 50,
                      height: 50,
                  ),
                  Text(category[index].catName)
                ],
              ),
            );
          }),
    );
  }
}
