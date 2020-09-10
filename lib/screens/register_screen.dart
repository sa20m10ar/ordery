import 'package:flutter/material.dart';
import 'package:ordery/providers/category.dart';
import 'package:ordery/providers/product.dart';
import 'package:ordery/providers/restaurant.dart';
import 'package:ordery/providers/user.dart';
import 'package:ordery/screens/home.dart';
import 'package:ordery/screens/login_screen.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {

    final authProvider = Provider.of<UserProvider>(context);
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final restaurantProvider = Provider.of<RestaurantProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      key: _key,

      backgroundColor: Color(0xffFDFDFE),
      body: authProvider.status == Status.Authenticating ?
          Center(
            child: CircularProgressIndicator(),
          )
     : SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            Align(
              alignment: Alignment.center,
              child: Container(
                  height: MediaQuery.of(context).size.height*0.4,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset('assets/images/logo.png')),
            ),
            Text(
              'Ordery',
              style: TextStyle(fontSize: 35, color: Color(0xffF22A2A) ,fontWeight: FontWeight.bold),
            ),

            Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.only(
                left: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextFormField(
                controller: authProvider.name,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Username",
                    icon: Icon(Icons.person_outline)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 15, left: 15, bottom: 15),
              padding: EdgeInsets.only(
                left: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextFormField(
                controller: authProvider.email,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Email",
                    icon: Icon(Icons.email)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 15, left: 15, bottom: 15),
              padding: EdgeInsets.only(
                left: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextFormField(
                controller: authProvider.password,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Password",
                    icon: Icon(Icons.lock)),
              ),
            ),
            GestureDetector(
              onTap: ()async{
                if(!await authProvider.signUp()){
                  _key.currentState.showSnackBar(
                      SnackBar(content: Text("Resgistration failed!"))
                  );
                  return;
                }
                categoryProvider.loadCategories();
                restaurantProvider.loadSingleRestaurant();
                productProvider.loadProducts();
                authProvider.clearController();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: Container(
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.only(
                  left: 10,
                ),
                width: MediaQuery.of(context).size.width * 0.9,
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xffF22A2A),
                  //  border: Border.all(color: Colors.grey,),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Register',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Text(
                'Login Here',
                style: TextStyle(fontSize: 20, color: Colors.grey[800]),
              ),
            )
          ],
        ),
      ),
    );;
  }
}
