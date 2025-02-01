import 'package:flutter/material.dart';
import 'package:ur_boba/models/boba_drinks.dart';

class BobaShop extends ChangeNotifier {
  List <BobaDrinks> bobaForSale = [
    BobaDrinks(name: "Choco Boba ", price: "1200 Fcfa", imagePath: "assets/images/choco_boba.png"),
    BobaDrinks(name: "Big Cream Boba ", price: "2000 Fcfa", imagePath: "assets/images/big_cream_choco.png"),
    BobaDrinks(name: "Dark Choco Boba ", price: "1500 Fcfa", imagePath: "assets/images/dark_choco_boba.png"),
    BobaDrinks(name: "Cream Boba ", price: "1200 Fcfa", imagePath: "assets/images/little_cream_choco.png"),
    BobaDrinks(name: "Matcha Boba ", price: "1700 Fcfa", imagePath: "assets/images/matcha_boba.png"),
    BobaDrinks(name: "SugarRush Boba ", price: "1500 Fcfa", imagePath: "assets/images/mint_boba.png"),
  ];
  List <BobaDrinks> userCart = [];

  get allBoba => bobaForSale;
  get theUserCart => userCart;

  removeBobaFormCart(BobaDrinks boba) {
    userCart.remove(boba);
    notifyListeners();
  }

  addBobaToCart(BobaDrinks boba) {
    userCart.add(boba);
    notifyListeners();
  }

  emptyCart(List <BobaDrinks> userCart) {
    userCart.clear();
    notifyListeners();
  }
}