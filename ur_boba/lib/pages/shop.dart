// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ur_boba/components/boba_tile.dart';
import 'package:ur_boba/models/boba_drinks.dart';
import 'package:ur_boba/models/boba_shop.dart';
import 'package:ur_boba/pages/order_a_boba.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {

  void goToOrderPage(BobaDrinks selectedBoba) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => OrderABoba(boba: selectedBoba)));
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
                      "Your Boba Shop ♡",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Expanded(
                        child: ListView.builder(
                            itemCount: value.bobaForSale.length,
                            itemBuilder: (context, index) {
                              BobaDrinks individualBoba =
                                  value.bobaForSale[index];
                              return BobaTile(
                                boba: individualBoba,
                                onTap: () {
                                  goToOrderPage(individualBoba);
                                },
                                trailing: Icon(Icons.arrow_forward_rounded, color: Colors.brown[400], size: 25,),
                              );
                            }))
                  ],
                )),
              ))),
    );
  }
}
