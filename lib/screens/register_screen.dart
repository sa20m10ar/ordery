import 'package:flutter/material.dart';
import 'package:ordery/screens/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFDFDFE),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset('assets/images/logo.jpg')),
            ),
            Text(
              'Ordery',
              style: TextStyle(fontSize: 35, color: Colors.green ,fontWeight: FontWeight.bold),
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
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Password",
                    icon: Icon(Icons.lock)),
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.only(
                left: 10,
              ),
              width: MediaQuery.of(context).size.width * 0.9,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.red,
                //  border: Border.all(color: Colors.grey,),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
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
