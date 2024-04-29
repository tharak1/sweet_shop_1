import 'package:flutter/material.dart';
import 'package:sweet_shop/models/cart_model.dart';
import 'package:sweet_shop/models/sweet_model.dart';

class SweetCard extends StatefulWidget {
  final Sweet sweetvar;
  final List<Cart> inCart;
  const SweetCard({super.key, required this.sweetvar, required this.inCart});

  @override
  State<SweetCard> createState() => _SweetCardState();
}

class _SweetCardState extends State<SweetCard> {
  bool alreadyInCart = false;
  Cart cartobj = Cart(
      quantity: 1,
      sweetcart:
          Sweet(id: "", imgurl: "", name: "", price: 0, avalibility: false));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInCart();
    // find_the_item();
  }

  // find_the_item() async {
  //   List<Cart> temp = await Cart.loadListFromLocalStorage('cartItems4');
  //   cartobj = temp
  //       .where((element) => element.sweetcart.id == widget.sweetvar.id)
  //       .toList()[0];
  // }

  void getInCart() async {
    List<Cart> temp = await Cart.loadListFromLocalStorage('cartItems4');
    setState(() {
      List<Cart> nithin = temp
          .where((element) => element.sweetcart.id == widget.sweetvar.id)
          .toList();
      alreadyInCart = nithin.isNotEmpty;

      cartobj = nithin[0];
    });
  }

  void addToCart(Sweet cart) async {
    List<Cart> temp = await Cart.loadListFromLocalStorage('cartItems4');

    setState(() {
      temp.add(Cart(quantity: 1, sweetcart: cart));
    });
    Cart.saveListToLocalStorage(temp, 'cartItems4');
    getInCart();
    // find_the_item();
  }

  void increment() async {
    List<Cart> temp = await Cart.loadListFromLocalStorage('cartItems4');

    int index =
        temp.indexWhere((ele) => ele.sweetcart.id == cartobj.sweetcart.id);

    temp[index].quantity = cartobj.quantity + 1;
    setState(() {
      cartobj = temp[index];
    });
    Cart.saveListToLocalStorage(temp, 'cartItems4');
  }

  void decrement() async {
    List<Cart> temp = await Cart.loadListFromLocalStorage('cartItems4');

    int index =
        temp.indexWhere((ele) => ele.sweetcart.id == cartobj.sweetcart.id);
    if (cartobj.quantity > 1) {
      temp[index].quantity = cartobj.quantity - 1;
      setState(() {
        cartobj = temp[index];
      });
      Cart.saveListToLocalStorage(temp, 'cartItems4');
    } else {
      temp.removeAt(index);
      Cart.saveListToLocalStorage(temp, 'cartItems4');
      setState(() {
        alreadyInCart = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                    widget.sweetvar.imgurl,
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
                      widget.sweetvar.name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            '₹${widget.sweetvar.price}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          !alreadyInCart
                              ? OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    minimumSize: Size(60, 30),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    side: BorderSide(color: Colors.red),
                                    backgroundColor: Colors.red,
                                  ),
                                  onPressed: () {
                                    addToCart(widget.sweetvar);
                                  },
                                  child: Text(
                                    'Add to Cart',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              : Row(
                                  children: [
                                    IconButton(
                                      onPressed: decrement,
                                      icon: Icon(
                                        Icons.remove_circle,
                                        color: Colors.red,
                                      ),
                                    ),
                                    Text(cartobj.quantity.toString()),
                                    IconButton(
                                      onPressed: () {
                                        increment();
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
    );
  }
}
