class HomeModel {
  final bool status;
  final HomeDataModel data;

  HomeModel({required this.status, required this.data});

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      status: json["status"],
      data: HomeDataModel.fromJson(json["data"]),
    );
  }
}

class HomeDataModel {
  final List<BannerModel> banners;
  final List<ProductModel> products;

  HomeDataModel({required this.banners, required this.products});

  factory HomeDataModel.fromJson(Map<String, dynamic> json) {
    List<BannerModel> banners = [];
    List<ProductModel> products = [];

    if (json["banners"] != null) {
      banners = List<BannerModel>.from(
        json["banners"].map((banner) => BannerModel.fromJson(banner)),
      );
    }

    if (json["products"] != null) {
      products = List<ProductModel>.from(
        json["products"].map((product) => ProductModel.fromJson(product)),
      );
    }

    return HomeDataModel(banners: banners, products: products);
  }
}


class BannerModel {
  final int id;
  final String image;

  BannerModel({required this.id, required this.image});

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(id: json["id"], image: json["image"]);
  }
}

class ProductModel {
  final int id;
  final dynamic oldPrice;
  final dynamic price;
  final dynamic discount;
  final String image;
  final String name;
  final bool isFav;
  final bool inCart;

  ProductModel({
    required this.id,
    required this.image,
    required this.name,
    required this.discount,
    required this.inCart,
    required this.isFav,
    required this.oldPrice,
    required this.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      image: json["image"],
      name: json["name"],
      discount: json["discount"],
      inCart: json["in_cart"],
      isFav: json["in_favorites"],
      oldPrice: json["old_price"],
      price: json["price"],
    );
  }
}
