// ignore_for_file: unnecessary_string_interpolations, must_be_immutable

import 'package:flutter/material.dart';
import 'package:ur_boba/models/boba_drinks.dart';

class BobaTile extends StatefulWidget {
  final BobaDrinks boba;
  void Function()? onTap;
  final Widget trailing;
  BobaTile({super.key, required this.boba, required this.onTap, required this.trailing});

  @override
  State<BobaTile> createState() => _BobaTileState();
}

class _BobaTileState extends State<BobaTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.brown[100],
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            title: Text('${widget.boba.name}'),
            subtitle: Text('${widget.boba.price}'),
            leading: Image.asset(widget.boba.imagePath, height: 80, width: 80,),
            trailing: widget.trailing,
          ),
        ),
      ),
    );
  }
}


class BobaTileCart extends StatefulWidget {
  final BobaDrinks boba;
  final Widget trailing;
  BobaTileCart({super.key, required this.boba, required this.trailing});

  @override
  State<BobaTileCart> createState() => _BobaTileCartState();
}

class _BobaTileCartState extends State<BobaTileCart> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.brown[100],
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          title: Text('${widget.boba.name}'),
          subtitle: Text('${widget.boba.price}'),
          leading: Image.asset(widget.boba.imagePath, height: 80, width: 80,),
          trailing: widget.trailing,
        ),
      ),
    );
  }
}