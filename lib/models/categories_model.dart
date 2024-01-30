class CategoriesModel {
  final bool status;
  final CategoriesDataModel data;

  CategoriesModel({
    required this.status,
    required this.data,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      status: json["status"],
      data: CategoriesDataModel.fromJson(json["data"]),
    );
  }
}

class CategoriesDataModel {
  final int currentPage;
  final List<DataModel> dataModel;
  CategoriesDataModel({
    required this.currentPage,
    required this.dataModel,
  });

  factory CategoriesDataModel.fromJson(Map<String, dynamic> json) {
    List<DataModel> dataModel = [];


    if (json["data"] != null) {
      dataModel = List<DataModel>.from(
        json["data"].map((data) => DataModel.fromJson(data)),
      );
    }

    return CategoriesDataModel(
      currentPage: json["current_page"],
      dataModel: dataModel,
    );
  }
}

class DataModel {
  final int id;
  final String name;
  final String image;

  DataModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json["id"],
      name: json["name"],
      image: json["image"],
    );
  }
}
