import 'package:flutter/material.dart';
import 'package:flutter_cataloge/core/store.dart';
import 'package:flutter_cataloge/models/cart.dart';
import 'package:flutter_cataloge/models/catalog.dart';
import 'package:flutter_cataloge/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

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
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: _CartList(),
            ),
          ),
          Divider(),
          _CartTotal()
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxBuilder(
            mutations: {RemoveMutation},
            builder: (context, store, status) {
              return Text(
                "\$${_cart.totalPrice}",
                style: TextStyle(
                    fontSize: 25, color: Theme.of(context).buttonColor),
              );
            },
          ),

          // TextButton(
          //     onPressed: () {},
          //     child: Text("Buy"),
          //     style: TextButton.styleFrom(
          //         primary: Theme.of(context).canvasColor,
          //         backgroundColor: Theme.of(context).buttonColor))
          SizedBox(
            width: 90,
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Buying not supported yet")));
              },
              child: Text(
                "Buy",
                textScaleFactor: 1.35,
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Theme.of(context).buttonColor)),
            ),
          )
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? Center(
            child: Text(
              "Nothing to show",
              textScaleFactor: 1.7,
            ),
          )
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                  onPressed: () {
                    RemoveMutation(_cart.items[index]);
                  },
                  icon: Icon(Icons.remove_circle)),
              title: Text(_cart.items[index].name),
            ),
          );
  }
}
