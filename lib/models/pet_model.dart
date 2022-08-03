class PetModel {
  String? name;
  String? photo;
  int? age;
  int? weight;
  String? description;

  PetModel({name, photo, age, weight, description});

  PetModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    photo = json['photo'];
    age = json['age'];
    weight = json['weight'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['photo'] = photo;
    data['age'] = age;
    data['weight'] = weight;
    data['description'] = description;
    return data;
  }
}