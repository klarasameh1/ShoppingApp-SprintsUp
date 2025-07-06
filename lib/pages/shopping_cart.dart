import 'package:flutter/material.dart';
import 'package:shopping_app/pages/home_page.dart';

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
            child: Icon(Icons.shopping_cart_outlined, size: 80, color: Color(0xFFB284BE)),
          ),
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
                        icon: Icon(Icons.remove_circle_outline),
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
                        icon: Icon(Icons.add_circle_outline),
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
        ],
      ),
    );
  }
}
