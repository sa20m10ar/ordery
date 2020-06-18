import 'package:flutter/material.dart';


class PopularProducts extends StatefulWidget {
  @override
  _PopularProductsState createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              'assets/images/food.jpg',
            )),
        Positioned(
          top: 10,
          left: 10,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15)),
            padding: EdgeInsets.all(5),
            child: Row(
              children: <Widget>[

                Icon(
                  Icons.star,
                  color: Colors.red,
                  size: 18,
                ),
                Text('4.5'),
              ],
            ),
          ),
        ),
        Positioned(
          top: 10,
            right: 10,
            child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: Icon(
            Icons.favorite,
            color: Colors.red,
            size: 15,
          ),
        )),
        Positioned(
            bottom: 10,
            left: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text('Pan Cake' ,style: TextStyle(
                  color: Colors.white
                ),),
                Text('By:Pizza Hut' ,style: TextStyle(
                    color: Colors.white
                ),),
              ],
            )),
        Positioned(
            bottom: 10,
            right: 10,
            child: Text("\$"+'4.35',style: TextStyle(
              color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold
            ),))
      ],
    );
  }
}
