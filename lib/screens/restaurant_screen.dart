import 'package:flutter/material.dart';
import 'package:ordery/models/restaurant.dart';
import 'package:ordery/providers/product.dart';
import 'package:ordery/screens/product_details.dart';
import 'package:ordery/widgets/product.dart';
import 'package:provider/provider.dart';

class RestaurantScreen extends StatelessWidget {
  final RestaurantModel restaurantModel;

  const RestaurantScreen({Key key, this.restaurantModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
//                  Positioned.fill(
//                      child: Align(
//                        alignment: Alignment.center,
//                        child: Loading(),
//                      )),

              // restaurant image
              ClipRRect(
//                    borderRadius: BorderRadius.only(
//                      bottomLeft: Radius.circular(20),
//                      bottomRight: Radius.circular(20),
//                    ),
                child: Image.network(
                  restaurantModel.image,
                  height: 160,
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width,
                  // width: double.infinity,
                ),
              ),

              // fading black
              Container(
                height: 160,
                decoration: BoxDecoration(
//                        borderRadius: BorderRadius.only(
//                          bottomLeft: Radius.circular(20),
//                          bottomRight: Radius.circular(20),
//                        ),
                    gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0.4),
                    Colors.black.withOpacity(0.1),
                    Colors.black.withOpacity(0.05),
                    Colors.black.withOpacity(0.025),
                  ],
                )),
              ),

              //restaurant name
              Positioned.fill(
                  bottom: 60,
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        restaurantModel.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w300,
                        ),
                      ))),

              // average price
              Positioned.fill(
                  bottom: 40,
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "Average Price: \$" +
                            restaurantModel.avgPrice.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                      ))),

              // rating widget
              Positioned.fill(
                  bottom: 2,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Icon(
                                Icons.star,
                                color: Colors.yellow[900],
                                size: 20,
                              ),
                            ),
                            Text(restaurantModel.rating.toString()),
                          ],
                        ),
                      ),
                    ),
                  )),

              // close button
              Positioned.fill(
                  top: 5,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.black.withOpacity(0.2)),
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                            )),
                      ),
                    ),
                  )),

              //like button
              Positioned.fill(
                  top: 5,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  )),
            ],
          ),
          SizedBox(
            height: 10,
          ),

//              open & book section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "Open",
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
              ),
              Container(
                  child: FlatButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.restaurant_menu),
                      label: Text("Book Now")))
            ],
          ),

          // products
          Column(
            children: productProvider.productsByRestaurant
                .map((item) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ProductDetails(
                                      product: item,
                                    )));
                      },
                      child: ProductWidget(
                        product: item,
                      ),
                    ))
                .toList(),
          )
        ],
      )),
    );
  }
}
