import 'package:flutter/material.dart';
import 'package:flutter_cataloge/widgets/themes.dart';

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


