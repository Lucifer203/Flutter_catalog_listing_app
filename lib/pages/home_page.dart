import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_cataloge/models/catalog.dart';
import 'package:flutter_cataloge/utils/routes.dart';
import 'package:flutter_cataloge/widgets/item_widget.dart';
import 'package:flutter_cataloge/widgets/themes.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/drawer.dart';
import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';

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
        backgroundColor: Theme.of(context).canvasColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          child: Icon(CupertinoIcons.cart, color: Colors.white),
          backgroundColor: Theme.of(context).buttonColor,
        ),
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
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 14, 0, 0),
                    child: Center(child: CircularProgressIndicator()),
                  ),
                ),
            ],
          ),
        )));
  }
}
