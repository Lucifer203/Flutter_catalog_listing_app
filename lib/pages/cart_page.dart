import 'package:flutter/material.dart';
import 'package:flutter_cataloge/widgets/themes.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Padding(
            padding: const EdgeInsets.fromLTRB(105, 0, 0, 0),
            child: Text("Cart"),
          )),
    );
  }
}
