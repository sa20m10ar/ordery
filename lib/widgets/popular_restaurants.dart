import 'package:flutter/material.dart';
import 'package:ordery/models/restaurant.dart';
import 'package:ordery/providers/product.dart';
import 'package:ordery/providers/restaurant.dart';
import 'package:ordery/screens/restaurant_screen.dart';
import 'package:provider/provider.dart';

class PopularRestaurants extends StatelessWidget {
//  final RestaurantModel  restaurantModel ;
//
//  const PopularRestaurants({Key key, this.restaurantModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final restaurantProvider = Provider.of<RestaurantProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);

    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: restaurantProvider.restaurants.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () async {
              await productProvider.loadProductsByRestaurant();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => RestaurantScreen(
                            restaurantModel:
                                restaurantProvider.restaurants[index],
                          )));
            },
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[400],
                            offset: Offset(8, 6),
                            blurRadius: 9)
                      ]),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        restaurantProvider.restaurants[index].image,
                        fit: BoxFit.cover,
                      )),
                ),
                Positioned(
                    bottom: 15,
                    left: 20,
                    right: 20,
                    child: Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.7),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                restaurantProvider.restaurants[index].name,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.star,
                                    color: Colors.red,
                                    size: 25,
                                  ),
                                  Text(
                                    restaurantProvider.restaurants[index].rating
                                        .toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          restaurantProvider.restaurants[index].liked
                              ? Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 30,
                                )
                              : Icon(
                                  Icons.favorite_border,
                                  color: Colors.red,
                                  size: 30,
                                ),
                        ],
                      ),
                    )),
              ],
            ),
          );
        },
      ),
    );
  }
}

//
//Stack(
//children: <Widget>[
//ClipRRect(
//borderRadius: BorderRadius.circular(15),
//child: Image.network(
//restaurantProvider.restaurants[index].image,
//
//)),
//Positioned(
//top: 10,
//left: 10,
//child: Container(
//decoration: BoxDecoration(
//color: Colors.white,
//shape: BoxShape.rectangle,
//borderRadius: BorderRadius.circular(15)),
//padding: EdgeInsets.all(5),
//child:
//),
//),
//Positioned(
//top: 10,
//right: 10,
//child: Container(
//padding: EdgeInsets.all(5),
//decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
//child: restaurantProvider.restaurants[index].liked ?

//: Icon(
//Icons.favorite_border,
//color: Colors.red,
//size: 15,
//)
//
//)),
//Positioned(
//bottom: 10,
//left: 10,
//child: Column(
//mainAxisAlignment: MainAxisAlignment.start,
//children: <Widget>[
//Text('Pan Cake' ,style: TextStyle(
//color: Colors.white
//),),
//Text('By:Pizza Hut' ,style: TextStyle(
//color: Colors.white
//),),
//],
//)),
//Positioned(
//bottom: 10,
//right: 10,
//child: Text("\$"+'4.35',style: TextStyle(
//color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold
//),))
//],
//);
