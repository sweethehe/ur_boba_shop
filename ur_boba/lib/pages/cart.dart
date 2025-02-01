import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ur_boba/components/boba_tile.dart';
import 'package:ur_boba/models/boba_drinks.dart';
import 'package:ur_boba/models/boba_shop.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  buildDialog(BuildContext context, BobaShop value) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: value.userCart.isEmpty ? Text("Nothing in the cart :)") : Text("Thanks for your purshase ♡"),
          actions: <Widget>[
            MaterialButton(
              child: Text("Close", style: TextStyle(color: Colors.white),),
              color: Colors.brown,
              onPressed: () {
                value.emptyCart(value.userCart);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[200],
      body: Consumer<BobaShop>(
          builder: (context, value, child) => SafeArea(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your Boba Cart ♡",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    if (value.userCart.isEmpty) ...[
                      Expanded(
                        child: Center(
                          child: Text(
                            "Nothing here for the moment :)",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      )
                    ] else ...[
                      Expanded(
                          child: ListView.builder(
                              itemCount: value.userCart.length,
                              itemBuilder: (context, index) {
                                BobaDrinks individualBoba =
                                    value.userCart[index];
                                return Dismissible(
                                  background: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.brown[300],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Icon(
                                      Icons.delete_rounded,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                  ),
                                  key: ValueKey<BobaDrinks>(
                                      value.userCart[index]),
                                  onDismissed: (direction) {
                                    setState(() {
                                      value.removeBobaFormCart(individualBoba);
                                    });
                                  },
                                  child: BobaTileCart(
                                    boba: individualBoba,
                                    trailing: IconButton(
                                        onPressed: () {
                                          value.removeBobaFormCart(
                                              individualBoba);
                                        },
                                        icon: Icon(
                                          Icons.delete_rounded,
                                          color: Colors.brown[400],
                                          size: 25,
                                        )),
                                  ),
                                );
                              })),
                    ],
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          MaterialButton(
                            onPressed: () {
                              buildDialog(context, value);
                            },
                            color: Colors.brown,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                            child: Text(
                              "Pay ♡",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                          MaterialButton(
                            onPressed: () {
                              value.emptyCart(value.userCart);
                            },
                            color: Colors.brown,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                            child: Text(
                              "Empty the cart ♡",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
              ))),
    );
  }
}
