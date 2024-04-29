import 'package:flutter/material.dart';
import 'package:sweet_shop/models/cart_model.dart';

class BillScreen extends StatefulWidget {
  const BillScreen({super.key});

  @override
  State<BillScreen> createState() => _BillScreenState();
}

class _BillScreenState extends State<BillScreen> {
  List<Cart> inCart = [];
  double sum = 0.0;

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

      calculateTotalPrice(inCart);
    });
  }

  calculateTotalPrice(List<Cart> cartItems) {
    sum = cartItems.fold(
      0,
      (total, cartItem) =>
          total + ((cartItem.sweetcart.price) * (cartItem.quantity)),
    );
    //   cartItems.forEach((cartItem) {
    //     sum += cartItem.sweetcart.price * cartItem.quantity;
    //   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Billing Page'),
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                children: [
                  Text(
                    'total:$sum',
                    style: TextStyle(fontSize: 20),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Order Placed Successfully'),
                        ),
                      );
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Order Placed'),
                          content: Text(
                              'more details will be send soon  Thank You for Placing Order'),
                        ),
                      );
                    },
                    child: Text(
                      'Place Order',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
