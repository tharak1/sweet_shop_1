// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sweet_shop/models/sweet_model.dart';

class Cart {
  int quantity;
  final Sweet sweetcart;

  Cart({required this.quantity, required this.sweetcart});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'quantity': quantity,
      'sweetcart': sweetcart.toMap(),
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      quantity: map['quantity'] as int,
      sweetcart: Sweet.fromMap(map['sweetcart'] as Map<String, dynamic>),
    );
  }

  // Save a list of models to SharedPreferences
  static Future<void> saveListToLocalStorage(
      List<Cart> list, String key) async {
    final prefs = await SharedPreferences.getInstance();
    final encodedList = list.map((book) => book.toMap()).toList();
    prefs.setString(key, jsonEncode(encodedList));
  }

  // Load a list of models from SharedPreferences
  static Future<List<Cart>> loadListFromLocalStorage(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(key);
    if (jsonString != null) {
      final decodedList = jsonDecode(jsonString) as List<dynamic>;
      return decodedList.map((map) => Cart.fromMap(map)).toList();
    }
    return [];
  }

  // Delete a book with a specific ID from SharedPreferences
  static Future<void> deleteBookFromLocalStorage(String key, String id) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(key);
    if (jsonString != null) {
      final decodedList = jsonDecode(jsonString) as List<dynamic>;
      final updatedList = decodedList.where((map) => map['id'] != id).toList();
      prefs.setString(key, jsonEncode(updatedList));
    }
  }

  String toJson() => json.encode(toMap());

  factory Cart.fromJson(String source) =>
      Cart.fromMap(json.decode(source) as Map<String, dynamic>);
}
