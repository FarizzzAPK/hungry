class OptionsModel {
  final String name;
  final String image;
  final int id;

  OptionsModel({required this.name, required this.image, required this.id});

  factory OptionsModel.fromJson(Map<String, dynamic> json){
    return OptionsModel(
        name: json["name"] ?? '',
        image: json["image"] ?? '',
        id: json["id"]);
  }
}