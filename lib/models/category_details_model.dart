class GetCatDetailsModel {
  final bool status;
  final ProductsData data;

  GetCatDetailsModel({required this.status, required this.data});

  factory GetCatDetailsModel.fromJson(Map<String,dynamic> json){
    return GetCatDetailsModel(
        status: json["status"],
        data: ProductsData.fromJson(json["data"]),
    );
  }
}

class ProductsData {
  final List<Product> products;

  ProductsData({required this.products});

  factory ProductsData.fromJson(Map<String,dynamic>json){

    List<Product> dataModel = [];

    if (json["data"] != null) {
      dataModel = List<Product>.from(
        json["data"].map((data) => Product.fromJson(data)),
      );
    }

    return ProductsData(products: dataModel);
  }


}

class Product {
  final int id;
  final dynamic oldPrice;
  final dynamic price;
  final dynamic discount;
  final String image;
  final String name;
  final bool isFav;
  final bool inCart;
  final List<dynamic> images;
  final String description;

  Product({
    required this.id,
    required this.image,
    required this.name,
    required this.discount,
    required this.inCart,
    required this.isFav,
    required this.oldPrice,
    required this.price,
    required this.images,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      image: json["image"],
      name: json["name"],
      discount: json["discount"],
      inCart: json["in_cart"],
      isFav: json["in_favorites"],
      oldPrice: json["old_price"],
      price: json["price"],
      images: json["images"],
      description: json["description"],
    );
  }
}
