import 'dart:convert';

HomeModel homeFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  final bool status;
  final dynamic message;
  final Data data;

  HomeModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  final List<Banners> banners;
  final List<Product> products;
  final String ad;

  Data({
    required this.banners,
    required this.products,
    required this.ad,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    banners: List<Banners>.from(json["banners"].map((x) => Banners.fromJson(x))),
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    ad: json["ad"],
  );

  Map<String, dynamic> toJson() => {
    "banners": List<dynamic>.from(banners.map((x) => x.toJson())),
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
    "ad": ad,
  };
}

class Banners {
  final int id;
  final String image;
  final dynamic category;
  final dynamic product;

  Banners({
    required this.id,
    required this.image,
    required this.category,
    required this.product,
  });

  factory Banners.fromJson(Map<String, dynamic> json) => Banners(
    id: json["id"],
    image: json["image"],
    category: json["category"],
    product: json["product"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "category": category,
    "product": product,
  };
}

class Product {
  final int id;
  final double price;
  final double oldPrice;
  final int discount;
  final String image;
  final String name;
  final String description;
  final List<String> images;
  final bool inFavorites;
  final bool inCart;

  Product({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
    required this.inFavorites,
    required this.inCart,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    price: json["price"]?.toDouble(),
    oldPrice: json["old_price"]?.toDouble(),
    discount: json["discount"],
    image: json["image"],
    name: json["name"],
    description: json["description"],
    images: List<String>.from(json["images"].map((x) => x)),
    inFavorites: json["in_favorites"],
    inCart: json["in_cart"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "price": price,
    "old_price": oldPrice,
    "discount": discount,
    "image": image,
    "name": name,
    "description": description,
    "images": List<dynamic>.from(images.map((x) => x)),
    "in_favorites": inFavorites,
    "in_cart": inCart,
  };
}
