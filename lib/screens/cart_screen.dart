import 'package:flutter/material.dart';
import 'package:ordery/helpers/order.dart';
import 'package:ordery/models/cart_item.dart';
import 'package:ordery/providers/app.dart';
import 'package:ordery/providers/user.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';


class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final _key = GlobalKey<ScaffoldState>();
  OrderServices _orderServices = OrderServices();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    final app = Provider.of<AppProvider>(context);

    return Scaffold(
      key: _key,
      backgroundColor: Color(0xfffbfbfb),
      appBar: AppBar(
        title: Text(
          'your cart items',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Color(0xfffbfbfb),
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.red,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.all(15),
                  child: Icon(
                    Icons.shopping_cart,
                    color: Colors.red,
                    size: 30,
                  )),
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
                        user.userModel.cart.length.toString(),
                        style: TextStyle(color: Colors.red),
                      ))),
            ],
          )
        ],
      ),
      body: ListView.builder(
          itemCount: user.userModel.cart.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 10),
              width: MediaQuery.of(context).size.width,
              height: 100,
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
                          child: Image.network(
                            user.userModel.cart[index].image,
                            height: 120,
                            width: 140,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            user.userModel.cart[index].name,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: <Widget>[
//                              Text(
//                                '\$',
//                                style: TextStyle(
//                                    fontSize: 20,
//                                    color: Colors.red,
//                                    fontWeight: FontWeight.bold),
//                              ),
                              Text(
                                "\$${user.userModel.cart[index].price / 100}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
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
                      onPressed: () async {
                        app.changeLoading();
                        bool value = await user.removeFromCart(
                            cartItem: user.userModel.cart[index]);
                        if (value) {
                          user.reloadUserModel();
                          print("Item removed from cart");
                          _key.currentState.showSnackBar(
                              SnackBar(content: Text("Removed from Cart!")));
                          app.changeLoading();
                          return;
                        } else {
                          print("ITEM WAS NOT REMOVED");
                          app.changeLoading();
                        }
                      })
                ],
              ),
            );
          }),
      bottomNavigationBar: Container(
        height: 70,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "Total: ",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 22,
                          fontWeight: FontWeight.w400)),
                  TextSpan(
                      text: " \$${user.userModel.totalCartPrice / 100}",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 22,
                          fontWeight: FontWeight.normal)),
                ]),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: Colors.red),
                child: FlatButton(
                    onPressed: () {
                      if (user.userModel.totalCartPrice == 0) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                //this right here
                                child: Container(
                                  height: 100,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              'Your cart is empty',
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                        return;
                      }
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              //this right here
                              child: Container(
                                height: 200,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'You will be charged \$${user.userModel.totalCartPrice / 100} upon delivery!',
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        width: 320.0,
                                        child: RaisedButton(
                                          onPressed: () async {
                                            var uuid = Uuid();
                                            String id = uuid.v4();
                                            _orderServices.createOrder(
                                                userId: user.user.uid,
                                                id: id,
                                                description:
                                                    "Some random description",
                                                status: "complete",
                                                totalPrice: user
                                                    .userModel.totalCartPrice,
                                                cart: user.userModel.cart);
                                            for (CartItemModel cartItem
                                                in user.userModel.cart) {
                                              bool value =
                                                  await user.removeFromCart(
                                                      cartItem: cartItem);
                                              if (value) {
                                                user.reloadUserModel();
                                                print("Item added to cart");
                                                _key.currentState.showSnackBar(
                                                    SnackBar(
                                                        content: Text(
                                                            "Removed from Cart!")));
                                              } else {
                                                print("ITEM WAS NOT REMOVED");
                                              }
                                            }
                                            _key.currentState.showSnackBar(
                                                SnackBar(
                                                    content: Text(
                                                        "Order created!")));
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "Accept",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          color: const Color(0xFF1BC0C5),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 320.0,
                                        child: RaisedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              "Reject",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            color: Colors.red),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                    child: Text(
                      "Check out",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
