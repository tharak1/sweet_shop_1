import 'package:flutter/material.dart';
import 'package:sweet_shop/models/category.dart';

class RemoveCategory extends StatefulWidget {
  const RemoveCategory({super.key});

  @override
  State<RemoveCategory> createState() => _RemoveCategoryState();
}

class _RemoveCategoryState extends State<RemoveCategory> {
  List<Add_Category> addCat = [];

  @override
  void initState() {
    super.initState();
    loadCategories();
  }

  loadCategories() async {
    List<Add_Category> temp = [];
    temp = await Add_Category.loadListFromLocalStorage('categories');
    setState(() {
      addCat = temp;
    });
  }

  deleteFromCategory(int index) async {
    setState(() {
      addCat.removeAt(index);
    });
    await Add_Category.saveListToLocalStorage(addCat, "categories");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Remove Category'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: addCat.length,
              itemBuilder: (context, index) {
                return ListTile(
                  trailing: IconButton(
                    onPressed: () => deleteFromCategory(index),
                    icon: Icon(
                      Icons.delete,
                    ),
                  ),
                  leading: Image.memory(
                    addCat[index].img,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(addCat[index].name),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
