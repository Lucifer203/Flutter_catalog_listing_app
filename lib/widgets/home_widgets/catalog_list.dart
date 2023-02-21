import 'package:flutter/material.dart';
import 'package:flutter_cataloge/models/cart.dart';
import 'package:flutter_cataloge/pages/home_detail_page.dart';
import 'package:flutter_cataloge/widgets/themes.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/catalog.dart';
import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogeModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogeModel.items[index];
        return InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomeDetailPage(catalog: catalog))),
          child: CatalogItem(catalog: catalog),
        );
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({super.key, required this.catalog})
      : assert(catalog != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      // child: Card(
      //shape: RoundedRectangleBorder(
      //borderRadius: BorderRadius.circular(15.0),
      //),
      child: Container(
        height: 100.0,
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Hero(
                tag: Key(catalog.id.toString()),
                child: CatalogImage(image: catalog.image)),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  catalog.name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 12,
                      color: Theme.of(context).accentColor),
                ),
                Text(
                  catalog.desc,
                  style: TextStyle(fontWeight: FontWeight.w200, fontSize: 10),
                ),
                SizedBox(
                  height: 5,
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.fromLTRB(0, 0, 16, 0),
                  children: [
                    Text(
                      "\$${catalog.price}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).accentColor),
                    ),
                    _AddToCart(catalog: catalog)
                  ],
                )
              ],
            ))
          ],
        ),
      ),
      // ),
    );
  }
}

class _AddToCart extends StatefulWidget {
  final Item catalog;
  const _AddToCart({
    super.key,
    required this.catalog,
  });

  @override
  State<_AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<_AddToCart> {
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        isAdded = true;
        final _catalog = CatalogeModel();
        final _cart = CartModel();
        _cart.catalog = _catalog;
        _cart.add(widget.catalog);
        setState(() {});
      },
      child: isAdded ? Icon(Icons.done) : Text("Add to Cart"),
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Theme.of(context).buttonColor),
          shape: MaterialStateProperty.all(StadiumBorder())),
    );
  }
}
