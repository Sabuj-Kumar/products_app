class ProductModel {
  String? title;
  String? description;
  String? image;
  int? price;

  ProductModel(
      {required this.title,
      required this.description,
      required this.image,
      required this.price});

  ProductModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    image = json['image'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = title;
    data['description'] = description;
    data['image'] = image;
    data['price'] = price;
    return data;
  }
}
