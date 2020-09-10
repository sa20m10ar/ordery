import 'package:flutter/material.dart';
import 'package:ordery/models/product.dart';
import 'package:ordery/providers/product.dart';
import 'package:ordery/providers/restaurant.dart';
import 'package:ordery/screens/restaurant_screen.dart';
import 'package:provider/provider.dart';


class ProductWidget extends StatelessWidget {
  final ProductModel product;

  const ProductWidget({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final restaurantProvider = Provider.of<RestaurantProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);

    return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 4, bottom: 10),
        child: Container(
            height: 100,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[300],
                      offset: Offset(-2, -1),
                      blurRadius: 5),
                ]),
//            height: 160,
            child: Row(
              children: <Widget>[
                Container(
                  width: 140,
                  height: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                    child: Image.network(
                      product.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              product.name,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey[300],
                                        offset: Offset(1, 1),
                                        blurRadius: 4),
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Icon(
                                  Icons.favorite_border,
                                  color: Colors.red,
                                  size: 18,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 8,bottom: 10),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "from: ",
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w300,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                        GestureDetector(
                            onTap: ()async{
                              await productProvider.loadProductsByRestaurant(
                                  restaurantId: product.restaurantId.toString());
                              await restaurantProvider.loadSingleRestaurant();
                             Navigator.push(context, MaterialPageRoute(builder: (_)=> RestaurantScreen(restaurantModel: restaurantProvider.restaurant)));
                            },
                            child:Text(product.restaurant, style: TextStyle(
                              color: Colors.redAccent, fontWeight: FontWeight.w300, fontSize: 14,
                            ),)),

                      ],
                    ),
                  ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  product.rating.toString(),
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.red,
                                size: 16,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.red,
                                size: 16,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.red,
                                size: 16,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.grey,
                                size: 16,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Text(
                              "\$${product.price / 100}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      )
                          ],
                        ),
                      ),

                    ],
                  ),
                )
    );
  }
}
