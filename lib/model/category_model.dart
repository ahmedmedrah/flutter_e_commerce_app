class CategoryModel {
  String name, imgUrl;

  CategoryModel({this.name, this.imgUrl});
  CategoryModel.fromJson(Map<dynamic,dynamic> map){
    if(map == null)
      return;
    name = map['name'];
    imgUrl = map['imgUrl'];
  }

  toJson(){
    return{
      'name':name,
      'imgUrl':imgUrl,
    };
  }
}