import 'package:flutter/material.dart';
import 'package:ur_boba/components/bottom_nav_bar.dart';
import 'package:ur_boba/pages/about.dart';
import 'package:ur_boba/pages/cart.dart';
import 'package:ur_boba/pages/shop.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
  List<Widget> myPages = [const Shop(), const Cart()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[200],
        elevation: 0.0,
        surfaceTintColor: Colors.brown[200],
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        backgroundColor: Colors.brown[200],
        child: Column(
          children: [
            DrawerHeader(
                child: Image.asset(
              "assets/images/ur_boba_logo.png",
            )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                "Your Boba Shop ♡",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => About()));
                },
                child: ListTile(
                  title: Text(
                    "About",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  leading:
                      Icon(Icons.account_circle_rounded, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
      body: myPages[index],
      backgroundColor: Colors.brown[200],
      bottomNavigationBar:
          MyBottomNavBar(onTabChange: (index) => navigation(index)),
    );
  }

  navigation(int newIndex) {
    setState(() {
      index = newIndex;
    });
  }
}
