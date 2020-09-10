import 'package:flutter/material.dart';
import 'package:ordery/models/product.dart';
import 'package:ordery/providers/product.dart';
import 'package:ordery/screens/product_details.dart';
import 'package:provider/provider.dart';

class FeaturedProducts extends StatefulWidget {
  @override
  _FeaturedProductsState createState() => _FeaturedProductsState();
}

class _FeaturedProductsState extends State<FeaturedProducts> {

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Container(
      height: 250,
      //padding: EdgeInsets.all(10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: productProvider.products.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ProductDetails(
                          product: productProvider.products[index],
                        )));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.49,
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.only(left: 8, right: 8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[300],
                          offset: Offset(1, 1),
                          blurRadius: 4)
                    ],
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: productProvider.products[index].liked
                          ? Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 20,
                            )
                          : Icon(
                              Icons.favorite_border,
                              color: Colors.grey,
                              size: 20,
                            ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          productProvider.products[index].image,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          productProvider. products[index].name,
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              productProvider. products[index].rating.toString(),
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            Icon(
                              Icons.star,
                              size: 20,
                              color: Colors.red,
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              '\$',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              productProvider. products[index].price.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
