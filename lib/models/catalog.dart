class Item {
  String id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {this.id = "",
      this.name = "",
      this.desc = "",
      this.price = 0.0,
      this.color = "",
      this.image = ""});
}

final products = [
  Item(
      id: "Codepur001",
      name: "iPhone 12 Pro",
      desc: "Apple iphone 12th gen",
      price: 999,
      color: "#33505a",
      image:
          "https://assets.swappie.com/cdn-cgi/image/width=600,height=600,fit=contain,format=auto/swappie-iphone-12-pro-silver.png?v=11")
];
