import 'package:flutter/material.dart';
import 'package:ordery/models/category.dart';
import 'package:ordery/providers/category.dart';
import 'package:ordery/providers/product.dart';
import 'package:ordery/providers/user.dart';
import 'package:ordery/screens/category_screen.dart';
import 'package:provider/provider.dart';

class CategoriesList extends StatefulWidget {
  @override
  _CategoriesListState createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {



  @override
  Widget build(BuildContext context) {

    final categoryProvider = Provider.of<CategoryProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);


    return Container(
      height: 55,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoryProvider.categories.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: ()async{
                await productProvider.loadProductsByCategory();
                Navigator.push(context, MaterialPageRoute(builder: (_)=> CategoryScreen(
                  categoryModel: categoryProvider.categories[index],
                )));
              },
              child: Container(
                margin: EdgeInsets.only(left: 5, right: 5, bottom: 10),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[300],
                          offset: Offset(1, 1),
                          blurRadius: 4)
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Image.network(
                      categoryProvider.categories[index].image,
                      width: 50,
                      height: 50,
                    ),
                    Text(categoryProvider.categories[index].name)
                  ],
                ),
              ),
            );
          }),
    );
  }
}
