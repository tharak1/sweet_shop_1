// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Sweet {
  final String id;
  final String imgurl;
  final String name;
  final double price;

  final bool avalibility;

  Sweet(
      {required this.id,
      required this.imgurl,
      required this.name,
      required this.price,
      required this.avalibility});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'imgurl': imgurl,
      'name': name,
      'price': price,
      'avalibility': avalibility,
    };
  }

  factory Sweet.fromMap(Map<String, dynamic> map) {
    return Sweet(
      id: map['id'] as String,
      imgurl: map['imgurl'] as String,
      name: map['name'] as String,
      price: map['price'] as double,
      avalibility: map['avalibility'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Sweet.fromJson(String source) =>
      Sweet.fromMap(json.decode(source) as Map<String, dynamic>);
}
