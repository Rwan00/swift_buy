class GetFaModel {
  final bool status;
  final FavData data;

  GetFaModel({required this.status, required this.data});

  factory GetFaModel.fromJson(Map<String,dynamic> json){
    return GetFaModel(
        status: json["status"],
        data: FavData.fromJson(json["data"]),
    );
  }
}

class FavData {
  final List<DataModel> dataModel;

  FavData({required this.dataModel});

  factory FavData.fromJson(Map<String,dynamic>json){

    List<DataModel> dataModel = [];

    if (json["data"] != null) {
      dataModel = List<DataModel>.from(
        json["data"].map((data) => DataModel.fromJson(data)),
      );
    }

    return FavData(dataModel: dataModel);
  }


}

class DataModel {
  final int id;
  final Product product;

  DataModel({required this.id, required this.product});

  factory DataModel.fromJson(Map<String,dynamic>json){
    return DataModel(
        id: json["id"],
        product: Product.fromJson(json["product"]),
    );
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

  Product(
      {required this.id,
      required this.oldPrice,
      required this.price,
      required this.discount,
      required this.image,
      required this.name,
      required this.isFav});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      image: json["image"],
      name: json["name"],
      discount: json["discount"],
      isFav: json["in_favorites"],
      oldPrice: json["old_price"],
      price: json["price"],
    );
  }
}
