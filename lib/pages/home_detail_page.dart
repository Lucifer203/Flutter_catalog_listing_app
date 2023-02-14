import 'package:flutter/material.dart';
import 'package:flutter_cataloge/widgets/themes.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({super.key, required this.catalog})
      : assert(catalog != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.fromLTRB(0, 0, 30, 0),
          children: [
            Text(
              "\$${catalog.price}",
              textScaleFactor: 1.35,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: MyTheme.darkBlueColor),
            ),
            Container(
              width: 100,
              child: ElevatedButton(
                onPressed: () {},
                child: Icon(Icons.shop),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(MyTheme.darkBlueColor),
                    shape: MaterialStateProperty.all(StadiumBorder())),
              ),
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
                    height: 230,
                  )),
            ),
            Expanded(
                child: ClipPath(
              clipper: BackClipper(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 75),
                      child: Text(
                        catalog.name,
                        textScaleFactor: 1.8,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 12,
                            color: MyTheme.darkBlueColor),
                      ),
                    ),
                    Text(
                      catalog.desc,
                      textScaleFactor: 1.4,
                      style:
                          TextStyle(fontWeight: FontWeight.w300, fontSize: 10),
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
    path.quadraticBezierTo(size.width * 0.49, size.height * 0.37, 0, 0);
    //path.quadraticBezierTo(size.width * 0.5, size.height - 150, 0, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
