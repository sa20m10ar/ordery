import 'package:flutter/material.dart';
import 'package:ordery/widgets/categories_list.dart';
import 'package:ordery/widgets/featured_products.dart';
import 'package:ordery/widgets/popular_products.dart';

import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffbfbfb),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(10),
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(15),
                  width: 230,
                  child: Text(
                    'What Would you like to eat today ?',
                    style: TextStyle(fontSize: 20 ,),
                  ),
                ),
                Stack(
                  children: <Widget>[
                    IconButton(
                        icon: Icon(Icons.notifications_none), onPressed: () {}),
                    Positioned(
                      top: 12,
                      right: 12,
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration:
                            BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                      ),
                    )
                  ],
                )
              ],
            ),
            // ----------------------------- search box --------------------------------
            SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey[300], offset: Offset(1, 1), blurRadius: 4)
                  ]),
              child: ListTile(
                leading: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                title: TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      hintText: 'Search for Food or Restaurant',
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey[300])),
                ),
                trailing: Icon(
                  Icons.filter_list,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            //---------------------------------- Categories ----------------------------------
            CategoriesList(),
            // --------------------------------- Featured Food ---------------------------------
            SizedBox(
              height: 15,
            ),
            Text(
              'Featured Food ',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(
              height: 10,
            ),

            FeaturedProducts(),

            // --------------------------------- Popular Food ---------------------------------
            SizedBox(
              height: 10,
            ),
            Text(
              'Popular Food ',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(
              height: 15,
            ),

            PopularProducts(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:BorderRadius.only(topLeft: Radius.circular(20),topRight:Radius.circular(20), )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/home.png'))),
                ),
                Text('Home'),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/target.png'))),
                ),
                Text('Near By'),
              ],
            ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).
                push(MaterialPageRoute(builder: (context)=> CartScreen()));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/shopping-bag.png'))),
                  ),
                  Text('Cart'),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/avatar.png'))),
                ),
                Text('Profile'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
