import 'package:flutter/material.dart';
import 'package:sweet_shop/models/cart_model.dart';
import 'package:sweet_shop/models/sweet_model.dart';
import 'package:sweet_shop/widgets/sweet_card.dart';

class SweetsScreen extends StatefulWidget {
  const SweetsScreen({
    super.key,
    required this.sweetslist,
    required this.categoryname,
  });

  final List<Sweet> sweetslist;
  final String categoryname;

  @override
  State<SweetsScreen> createState() => _SweetsScreenState();
}

class _SweetsScreenState extends State<SweetsScreen> {
  List<Sweet> searchList = [];
  List<Cart> inCart = [];

  @override
  void initState() {
    searchList = widget.sweetslist;
    super.initState();
    //loadcart();
  }

  // void loadcart() async {
  //   inCart = await Cart.loadListFromLocalStorage('cartItems4');
  // }

  // void addToCart(Sweet cart) {
  //   setState(() {
  //     inCart.add(Cart(quantity: 1, sweetcart: cart));
  //   });
  //   Cart.saveListToLocalStorage(inCart, 'cartItems4');
  // }

  void filterSearchResults(String enteredKeyword) {
    List<Sweet> results = [];
    if (enteredKeyword.isEmpty) {
      results = widget.sweetslist;
    } else {
      results = widget.sweetslist
          .where((test) =>
              test.name.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      searchList = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryname),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                filterSearchResults(value);
              },
              decoration: const InputDecoration(
                labelText: "Search",
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25.0),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searchList.length,
              itemBuilder: (context, index) {
                Sweet sweetvar = searchList[index];
                return SweetCard(sweetvar: sweetvar, inCart: inCart);
              },
            ),
          ),
        ],
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:sweet_shop/models/sweet_model.dart';

// class SweetsScreen extends StatefulWidget {
//   const SweetsScreen({
//     Key? key,
//     required this.sweetslist,
//     required this.categoryname,
//   }) : super(key: key);

//   final List<Sweet> sweetslist;
//   final String categoryname;

//   @override
//   State<SweetsScreen> createState() => _SweetsScreenState();
// }

// class _SweetsScreenState extends State<SweetsScreen> {
//   List<Sweet> searchList = [];
//   TextEditingController _searchController = TextEditingController();

//   @override
//   void initState() {
//     searchList = widget.sweetslist;
//     super.initState();
//   }

//   void filterSearchResults(String enteredKeyword) {
//     List<Sweet> results = [];
//     if (enteredKeyword.isEmpty) {
//       results = widget.sweetslist;
//     } else {
//       results = widget.sweetslist
//           .where((sweet) =>
//               sweet.name.toLowerCase().contains(enteredKeyword.toLowerCase()))
//           .toList();
//     }
//     setState(() {
//       searchList = results;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.categoryname),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: _searchController,
//               onChanged: (value) {
//                 filterSearchResults(value);
//               },
//               decoration: InputDecoration(
//                 labelText: "Search",
//                 hintText: "Search",
//                 prefixIcon: Icon(Icons.search),
//                 suffixIcon: _searchController.text.isNotEmpty
//                     ? IconButton(
//                         onPressed: () {
//                           _searchController.clear();
//                           filterSearchResults('');
//                         },
//                         icon: Icon(Icons.clear),
//                       )
//                     : null,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(25.0),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: searchList.length,
//               itemBuilder: (context, index) {
//                 Sweet sweet = searchList[index];
//                 return SizedBox(
//                   height: MediaQuery.of(context).size.height / 8,
//                   child: ListTile(
//                     leading: sweet.name
//                             .toLowerCase()
//                             .contains(_searchController.text.toLowerCase())
//                         ? ClipRRect(
//                             borderRadius: BorderRadius.circular(10),
//                             child: Image.asset(
//                               sweet.imgurl,
//                               fit: BoxFit.fill,
//                               width: MediaQuery.of(context).size.width / 2,
//                               height: MediaQuery.of(context).size.height,
//                             ),
//                           )
//                         : null,
//                     title: Text(
//                       sweet.name,
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     subtitle: Text(
//                       '₹${sweet.price}',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     onTap: () {
//                       // Add your onTap logic here, if needed
//                     },
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
