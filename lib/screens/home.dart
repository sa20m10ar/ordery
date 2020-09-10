import 'package:flutter/material.dart';
import 'package:ordery/providers/user.dart';
import 'package:ordery/screens/order.dart';
import 'package:ordery/widgets/categories_list.dart';
import 'package:ordery/widgets/featured_products.dart';
import 'package:ordery/widgets/popular_restaurants.dart';
import 'package:provider/provider.dart';

import 'cart_screen.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);

    return Scaffold(
      backgroundColor: Color(0xfffbfbfb),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(

              decoration: BoxDecoration(color: Color(0xfffbfbfb)),
              accountName: Text(
                user.userModel?.name ?? "username lading...",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(user.userModel?.email ?? "email loading...",
                  style: TextStyle(
                    color: Colors.black,
                  )),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => HomeScreen()));
              },
              leading: Icon(Icons.home,color: Colors.red,),
              title: Text("Home"),
            ),
            ListTile(
            onTap: () async{
              await user.getOrders();
              Navigator.of(context).push(MaterialPageRoute(builder: (_)=> OrdersScreen()));

            },
              leading: Icon(Icons.bookmark_border,color: Colors.red,),
              title: Text("My orders"),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=> CartScreen()));
              },
              leading: Icon(Icons.shopping_cart,color: Colors.red,),
              title: Text("Cart"),
            ),
            ListTile(
              onTap: () {
                user.signOut();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => LoginScreen()));
              },
              leading: Icon(Icons.exit_to_app,color: Colors.red,),
              title: Text("Log out"),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.red,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => CartScreen()));
            },
          ),
        ],
        leading: Builder(
          builder: (context) =>
              IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.red,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
            // tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          ),
        ),
        title: Text(
          'What Would you like to eat ?',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(10),
          children: <Widget>[

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
                        color: Colors.grey[300],
                        offset: Offset(1, 1),
                        blurRadius: 4)
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

            // --------------------------------- Popular Restaurants ---------------------------------
            SizedBox(
              height: 10,
            ),
            Text(
              'Popular Restaurants ',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(
              height: 15,
            ),

            PopularRestaurants(),
          ],
        ),
      ),
    );
  }
}
