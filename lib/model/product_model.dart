class ProductModel {
  String name, description, imgUrl, color, size, price;

  ProductModel(
      {this.name,
      this.description,
      this.imgUrl,
      this.color,
      this.size,
      this.price});

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) return;
    name = map['name'];
    description = map['description'];
    imgUrl = map['imgUrl'];
    color = map['color'];
    size = map['size'];
    price = map['price'];
  }

  toJson() {
    return {
      'name': name,
      'description': description,
      'imgUrl': imgUrl,
      'color': color,
      'size': size,
      'price': price,
    };
  }
}
