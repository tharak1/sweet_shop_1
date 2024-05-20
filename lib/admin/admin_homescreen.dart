import 'package:flutter/material.dart';
import 'package:sweet_shop/admin/add_category.dart';
import 'package:sweet_shop/admin/homebutton_admin.dart';
import 'package:sweet_shop/admin/remove_category.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello,Admin\nWelcome'),
        elevation: 2,
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView(
              padding: const EdgeInsets.all(3),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 3 / 3,
              ),
              children: const [
                AdminHomebutton(
                  Name: 'Add category',
                  functionpg: AddCategory(),
                ),
                AdminHomebutton(
                  Name: 'Remove category',
                  functionpg: RemoveCategory(),
                ),
                AdminHomebutton(
                  Name: 'Add Sweet',
                  functionpg: AddCategory(),
                ),
                AdminHomebutton(
                  Name: 'Remove sweet',
                  functionpg: AddCategory(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
