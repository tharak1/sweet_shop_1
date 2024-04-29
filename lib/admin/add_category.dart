import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sweet_shop/admin/imageselection.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({super.key});

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController sweetNameController = TextEditingController();
  Uint8List? _image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Category'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.text,
              controller: categoryController,
              decoration: InputDecoration(
                labelText: "Enter the Category",
                fillColor: const Color.fromARGB(255, 215, 224, 243),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () async {
                Uint8List? dummy = await showImagePickerOption(context);
                setState(() {
                  _image = dummy;
                });
              },
              child: Container(
                clipBehavior: Clip.hardEdge,
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: _image != null
                    ? Image(
                        image: MemoryImage(_image!),
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        'assets/fileadd.jpg',
                        scale: 1.8,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
