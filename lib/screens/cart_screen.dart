import 'package:flutter/material.dart';
import 'package:sweet_shop/models/cart_model.dart';
import 'package:sweet_shop/screens/bill_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Cart> inCart = [];

  @override
  void initState() {
    super.initState();
    loadcart();
  }

  loadcart() async {
    List<Cart> temp = [];
    temp = await Cart.loadListFromLocalStorage('cartItems4');
    setState(() {
      inCart = temp;
    });
  }

  // deleteFromCart(String id, int index) async {
  //   setState(() {
  //     inCart.removeAt(index);
  //   });
  //   await Cart.saveListToLocalStorage(inCart, "cartItems4");
  // }

  void increment(int index) async {
    setState(() {
      inCart[index].quantity++;
    });
    await Cart.saveListToLocalStorage(inCart, 'cartItems4');
  }

  void decrement(int index) async {
    setState(() {
      if (inCart[index].quantity > 1) {
        inCart[index].quantity--;
      } else {
        inCart.removeAt(index);
      }
    });
    await Cart.saveListToLocalStorage(inCart, 'cartItems4');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BillScreen()),
              );
            },
            child: Text(
              'Billing',
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: inCart.length,
              itemBuilder: (context, index) => SizedBox(
                height: MediaQuery.of(context).size.height / 5.7,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              inCart[index].sweetcart.imgurl,
                              fit: BoxFit.fill,
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width / 3,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                inCart[index].sweetcart.name,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 40),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      '₹${inCart[index].sweetcart.price}',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            decrement(index);
                                          },
                                          icon: Icon(
                                            Icons.remove_circle,
                                            color: Colors.red,
                                          ),
                                        ),
                                        Text(inCart[index].quantity.toString()),
                                        IconButton(
                                          onPressed: () {
                                            increment(index);
                                          },
                                          icon: Icon(
                                            Icons.add_circle,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
