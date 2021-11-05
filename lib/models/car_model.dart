import 'dart:convert';

class CarModel {
  String name;
  String model;
  String price;
  String manufacturer;
  String type;
  String fuel;
  String id;

  CarModel({
    required this.name,
    required this.model,
    required this.price,
    required this.manufacturer,
    required this.type,
    required this.fuel,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'model': model,
      'price': price,
      'manufacturer': manufacturer,
      'type': type,
      'fuel': fuel,
      'id': id,
    };
  }

  factory CarModel.fromMap(Map<String, dynamic> map) {
    return CarModel(
      name: map['name'],
      model: map['model'],
      price: map['price'],
      manufacturer: map['manufacturer'],
      type: map['type'],
      fuel: map['fuel'],
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CarModel.fromJson(String source) => CarModel.fromMap(json.decode(source));
}
