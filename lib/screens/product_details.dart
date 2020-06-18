import 'package:flutter/material.dart';
import 'package:ordery/models/product.dart';
import 'package:carousel_pro/carousel_pro.dart';

class ProductDetails extends StatefulWidget {
  final Product product;

  const ProductDetails({Key key, this.product}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Stack(
            children: <Widget>[
              //------------------ Image Carousel -------------------------------------------
              Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: Carousel(
                  images: [
                    Image.asset(
                      widget.product.prodImage,
                      fit: BoxFit.fill,
                    ),
                    Image.asset(
                      widget.product.prodImage,
                      fit: BoxFit.fill,
                    ),
                    Image.asset(
                      widget.product.prodImage,
                      fit: BoxFit.fill,
                    ),
                  ],
                  dotVerticalPadding: 10,
                  showIndicator: true,
                  autoplay: false,
                  dotColor: Colors.grey,
                  dotIncreasedColor: Colors.red,
                ),
              ),
              //------------------ Back Button + Cart -------------------------------------------
              Container(
                margin: EdgeInsets.only(right: 30, top: 25),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    Image.asset(
                      'assets/images/shopping-bag.png',
                      width: 25,
                      height: 25,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              //------------------ cart count -------------------------------------------
              Positioned(
                  top: 40,
                  right: 40,
                  child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '2',
                        style: TextStyle(color: Colors.red),
                      ))),

              //------------------ Details -------------------------------------------

              Positioned(
                  top: 280,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        )),
                  ))
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      widget.product.prodName,
                      style: TextStyle(fontSize: 20),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          '\$',
                          style: TextStyle(fontSize: 20 ,color: Colors.red,
                          fontWeight: FontWeight.bold),
                        ),
                        Text('${widget.product.price}',style: TextStyle(fontSize: 20),),
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'By : ${widget.product.vendor}',
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          widget.product.rating.toString(),
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Icon(
                          Icons.star,
                          size: 18,
                          color: Colors.red,
                        ),
                        Icon(
                          Icons.star,
                          size: 18,
                          color: Colors.red,
                        ),
                        Icon(
                          Icons.star,
                          size: 18,
                          color: Colors.red,
                        ),
                        Icon(
                          Icons.star,
                          size: 18,
                          color: Colors.red,
                        ),
                        Icon(
                          Icons.star_half,
                          size: 18,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.remove), onPressed: () {}),
                    RaisedButton(
                      onPressed: () {},
                      color: Colors.red,
                      child: Text(
                        'Add to Cart',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      padding: EdgeInsets.only(
                          left: 30, right: 30, top: 15, bottom: 15),
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.add,
                          color: Colors.red,
                        ),
                        onPressed: () {}),
                  ],
                ),
                Text(
                  'Details : ',
                  style: TextStyle(color: Colors.red, fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                    softWrap: true,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
