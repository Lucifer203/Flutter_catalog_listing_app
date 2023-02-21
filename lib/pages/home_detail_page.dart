import 'package:flutter/material.dart';
import 'package:flutter_cataloge/widgets/themes.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/catalog.dart';
import '../widgets/home_widgets/add_to_cart.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({super.key, required this.catalog})
      : assert(catalog != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Theme.of(context).canvasColor,
      bottomNavigationBar: Container(
        color: Theme.of(context).cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.fromLTRB(0, 0, 30, 0),
          children: [
            Text(
              "\$${catalog.price}",
              textScaleFactor: 1.35,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).accentColor),
            ),
            AddToCart(
              catalog: catalog,
            )
          ],
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(75.0),
              child: Hero(
                  tag: Key(catalog.id.toString()),
                  child: Image.network(
                    catalog.image,
                    height: 200,
                  )),
            ),
            Expanded(
                child: ClipPath(
              clipper: BackClipper(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Text(
                        catalog.name,
                        textScaleFactor: 1.8,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 12,
                            color: Theme.of(context).accentColor),
                      ),
                    ),
                    Text(
                      catalog.desc,
                      textScaleFactor: 1.4,
                      style:
                          TextStyle(fontWeight: FontWeight.w300, fontSize: 10),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                          "Mobile phones and laptops are both types of electronic devices that allow users to perform various tasks, communicate with others, and access information. Mobile phones, also known as smartphones, are portable devices that can make phone calls, send text messages, take photos and videos, access the internet, and run various mobile apps. ",
                          textScaleFactor: 1.2,
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 10)),
                    ),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class BackClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double roundnessFactor = 50;
    var path = Path();

    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.17, 0, 0);
    //path.quadraticBezierTo(size.width * 0.5, size.height - 150, 0, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
