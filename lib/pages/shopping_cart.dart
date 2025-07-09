import 'package:flutter/material.dart';
import 'package:shopping_app/pages/home_page.dart';
import '../models/cart_item.dart';
import '../models/product.dart';

class ShoppingCart extends StatefulWidget {
  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: [
          Center(
            child: Icon(Icons.shopping_cart, size: 80, color: Color(0xFFB284BE)),
          ),
          SizedBox(height: 15,),
          Expanded(
            child: ListView.builder(
              itemCount: cartList.length,
              itemBuilder: (context, index) {
                final item = cartList[index];
                return ListTile(
                  leading: Image.asset(item.product.imageUrl, width: 50, height: 50),
                  title: Text(item.product.title),
                  subtitle: Text('Price: ${item.product.price} EGP'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove_outlined),
                        onPressed: () {
                          setState(() {
                            if (item.quantity > 1) {
                              item.quantity--;
                            } else {
                              cartList.removeAt(index);
                            }
                          });
                        },
                      ),
                      Text('${item.quantity}' , style: TextStyle(fontSize: 18 ),),
                      IconButton(
                        icon: Icon(Icons.add_outlined),
                        onPressed: () {
                          setState(() {
                            item.quantity++;
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total:", style: TextStyle(fontSize: 20)),
                Text("${calcTotal().toStringAsFixed(2)} EGP",
                    style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: ElevatedButton(
              onPressed: () {

                if(cartList.isEmpty){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Your Cart Is Empty")),
                  );
                }
                else{
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Ordered Successfully :)")),
                  );
                  cartList.clear();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                }

              },

              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Color(0xFFA361AE)) ,),
              child: Text("Proceed to Checkout", style: TextStyle(fontSize:18 , color: Colors.black)),
            ),
          )
        ],
      ),
    );
  }
  double calcTotal(){
    double total = 0.0 ;
    for (CartItem item in cartList){
      total += item.product.price * item.quantity ;
    }
    return total;
  }

}
