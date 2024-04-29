import 'package:sweet_shop/models/sweet_model.dart';

class Categories {
  final String name;
  final String imgurl;
  final List<Sweet> categorysweets;

  Categories(
      {required this.name, required this.imgurl, required this.categorysweets});
}
