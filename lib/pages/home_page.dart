import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_cataloge/models/catalog.dart';
import 'package:flutter_cataloge/widgets/item_widget.dart';
import 'package:flutter_cataloge/widgets/themes.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/drawer.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Codepur";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogeModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyTheme.creamColor,
        body: SafeArea(
            child: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogeModel.items != null && CatalogeModel.items.isNotEmpty)
                Expanded(child: CatalogList())
              else
                Center(
                  child: CircularProgressIndicator(),
                )
            ],
          ),
        )));
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Catalog App",
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: MyTheme.darkBlueColor),
        ),
        Text(
          "Trending products",
          style: TextStyle(fontSize: 12),
        )
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogeModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogeModel.items[index];
        return CatalogItem(catalog: catalog);
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
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            CatalogImage(image: catalog.image),
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
                      color: MyTheme.darkBlueColor),
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
                          color: MyTheme.darkBlueColor),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Icon(Icons.shop),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(MyTheme.darkBlueColor),
                          shape: MaterialStateProperty.all(StadiumBorder())),
                    )
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

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({super.key, required this.image}) : assert(image != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        child: Image.network(image),
        decoration: BoxDecoration(
            color: MyTheme.creamColor, borderRadius: BorderRadius.circular(12)),
        // color: MyTheme.creamColor,
        padding: EdgeInsets.all(12),
        width: MediaQuery.of(context).size.width / 3.8,
      ),
    );
  }
}
