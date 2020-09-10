import 'package:flutter/material.dart';
import 'package:ordery/providers/app.dart';
import 'package:ordery/providers/category.dart';
import 'package:ordery/providers/product.dart';
import 'package:ordery/providers/restaurant.dart';
import 'package:ordery/providers/user.dart';
import 'package:ordery/screens/login_screen.dart';
import 'package:provider/provider.dart';
import 'screens/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider.initialize()),
        ChangeNotifierProvider(create: (context) => CategoryProvider.initialize()),
        ChangeNotifierProvider(create: (context) => RestaurantProvider.initialize()),
        ChangeNotifierProvider(create: (context) => ProductProvider.initialize()),

      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Ordery',
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          home: ScreensController())));
}

class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<UserProvider>(context);
    switch (auth.status) {
      case Status.Uninitialized:
        return Center(
          child: CircularProgressIndicator(),
        );
      case Status.Authenticating:
        return LoginScreen();
      case Status.Authenticated:
        return HomeScreen();
      default:
        return LoginScreen();
    }
  }
}
