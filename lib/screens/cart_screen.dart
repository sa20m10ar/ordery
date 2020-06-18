import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfffbfbfb),
        appBar: AppBar(
          title: Text(
            'your cart items',
            style: TextStyle(color: Colors.red),
          ),
          centerTitle: true,
          backgroundColor: Color(0xfffbfbfb),
          elevation: 0,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          actions: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(15),
                  child: Image.asset(
                    'assets/images/shopping-bag.png',
                    fit: BoxFit.fill,
                    width: 25,
                    height: 25,
                    color: Colors.black,
                  ),
                ),
                Positioned(
                    top: 25,
                    right: 25,
                    child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey[300],
                                  offset: Offset(1, 1),
                                  blurRadius: 4)
                            ]),
                        child: Text(
                          '2',
                          style: TextStyle(color: Colors.red),
                        ))),
              ],
            )
          ],
        ),
        body: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width,
                height: 150,
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[300],
                          offset: Offset(2, 1),
                          blurRadius: 4)
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10),
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              'assets/images/burger2.jpg',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Cheese Burger',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
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
                                  '12.5',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: 25,
                        ),
                        onPressed: () {})
                  ],
                ),
              );
            }));
  }
}
