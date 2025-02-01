import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ur_boba/models/boba_drinks.dart';
import 'package:ur_boba/models/boba_shop.dart';

class OrderABoba extends StatefulWidget {
  final BobaDrinks boba;
  const OrderABoba({super.key, required this.boba});

  @override
  State<OrderABoba> createState() => _OrderABobaState();
}

class _OrderABobaState extends State<OrderABoba> {
  double sweetValue = 0.5;
  customizeSweetness(newValue) {
    setState(() {
      sweetValue = newValue;
    });
  }

  double pearlValue = 0.5;
  customizePearl(newValue) {
    setState(() {
      pearlValue = newValue;
    });
  }

  double iceValue = 0.5;
  customizeIce(newValue) {
    setState(() {
      iceValue = newValue;
    });
  }

  void goToCart() {
    Provider.of<BobaShop>(context, listen: false).addBobaToCart(widget.boba);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.brown[400]),
            child: Center(
                child: Text(
              "${widget.boba.name}succesfully added to the cart ♡ !",
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ))),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[200],
      appBar: AppBar(
        backgroundColor: Colors.brown,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          widget.boba.name,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(widget.boba.imagePath),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                          width: 100,
                          child: Text(
                            "Sweet",
                            style: TextStyle(fontSize: 18),
                          )),
                      Expanded(
                        child: Slider(
                            divisions: 4,
                            activeColor: Colors.brown,
                            label: sweetValue.toString(),
                            value: (sweetValue),
                            onChanged: (value) => customizeSweetness(value)),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                          width: 100,
                          child: Text(
                            "Pearl",
                            style: TextStyle(fontSize: 18),
                          )),
                      Expanded(
                        child: Slider(
                            divisions: 4,
                            activeColor: Colors.brown,
                            label: pearlValue.toString(),
                            value: (pearlValue),
                            onChanged: (value) => customizePearl(value)),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                          width: 100,
                          child: Text(
                            "Ice",
                            style: TextStyle(fontSize: 18),
                          )),
                      Expanded(
                        child: Slider(
                            divisions: 4,
                            activeColor: Colors.brown,
                            label: iceValue.toString(),
                            value: (iceValue),
                            onChanged: (value) => customizeIce(value)),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: MaterialButton(
                onPressed: () {
                  goToCart();
                },
                color: Colors.brown,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Text(
                  "Add to cart",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
