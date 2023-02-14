import 'package:flutter/material.dart';
import 'package:flutter_cataloge/widgets/themes.dart';

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
