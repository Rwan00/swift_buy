class GetSearchModel {
  final bool status;
  final SearchData data;

  GetSearchModel({required this.status, required this.data});

  factory GetSearchModel.fromJson(Map<String,dynamic> json){
    return GetSearchModel(
        status: json["status"],
        data: SearchData.fromJson(json["data"]),
    );
  }
}

class SearchData {
  final List<Product> products;

  SearchData({required this.products});

  factory SearchData.fromJson(Map<String,dynamic>json){

    List<Product> dataModel = [];

    if (json["data"] != null) {
      dataModel = List<Product>.from(
        json["data"].map((data) => Product.fromJson(data)),
      );
    }

    return SearchData(products: dataModel);
  }


}

class Product {
  final int id;
  final dynamic oldPrice;
  final dynamic price;
  final dynamic discount;
  final String image;
  final String name;

  Product(
      {required this.id,
      required this.oldPrice,
      required this.price,
      required this.discount,
      required this.image,
      required this.name,
 });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      image: json["image"],
      name: json["name"],
      discount: json["discount"],
      oldPrice: json["old_price"],
      price: json["price"],
    );
  }
}
