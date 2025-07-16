import 'package:flutter/material.dart';
import 'package:shopping_app/pages/shopping_cart.dart';
import '../widgets/product_card.dart';
import '../widgets/offer_tile.dart';
import '../models/product.dart';
import '../models/cart_item.dart';

final List<CartItem> cartList = [];
bool showContacts = false;

class HomePage extends StatefulWidget {
  HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Product> products = [
    Product(title: 'Lavender Face Bundle', imageUrl: 'assets/Products/product2.png', price: 300),
    Product(title: 'Eva Body Mist', imageUrl: 'assets/Products/product3.jpg', price: 150),
    Product(title: 'Hyaluronic Acid Serum', imageUrl: 'assets/Products/product4.jpg', price: 175),
    Product(title: 'Hyaluronic Acid Bundle', imageUrl: 'assets/Products/product5.jpg', price: 300),
    Product(title: 'Tonner', imageUrl: 'assets/Products/product6.jpg', price: 150),
  ];

  final List<String> offers = [
    "🎁 Promo Code: SHOPY25",
    "🚚 Free Shipping",
    "🛍️ Buy 1 Get 1",
    "🔥 Sale 50% Off",
    "💳 Cashback Deal",
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Our Products"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      drawer: Container(
        color: Colors.grey.shade100,
        width: MediaQuery.of(context).size.width * 0.6,
        child: ListView(
          children: [
            SizedBox(height: 60),
            ListTile(
              onTap: () {
                setState(() {});
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              title: Text("Home"),
              trailing: Icon(Icons.home_outlined),
            ),
            ListTile(
              onTap: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ShoppingCart()),
                  );
                });
              },
              title: Text("Your Cart"),
              trailing: Icon(Icons.shopping_cart_outlined),
            ),
            ListTile(
              onTap: () {
                setState(() {
                  showContacts = !showContacts;
                });
              },
              title: Text("Contact Us"),
              trailing: Icon(Icons.contact_mail_outlined),
            ),
            if (showContacts) ...[
              ListTile(
                leading: Icon(Icons.phone),
                title: Text(
                  "01280285510",
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                ),
              ),
              ListTile(
                leading: Icon(Icons.mail_outline),
                title: Text(
                  "klarasameh\n@gmail.com",
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                ),
              ),
              SizedBox(height: 40),
            ],

            ListTile(
              onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
              },
              title: Text("Log Out"),
              trailing: Icon(Icons.logout),
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 👆 Featured Products Slider
            SizedBox(
              height: 200,
              child: PageView(
                children: [
                  Image.asset('assets/Panners/Panner1.jpg', fit: BoxFit.cover),
                  Image.asset('assets/Panners/Panner3.jpg', fit: BoxFit.cover),
                  Image.asset('assets/Panners/Panner2.jpg', fit: BoxFit.cover),
                ],
              ),
            ),

            SizedBox(height: 20),

            // offers section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text("Hot Offers", style: TextStyle(fontSize: 20)),
            ),

            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: offers.length,
                itemBuilder: (context, index) {
                  return OfferTile(label: offers[index]);
                },
              ),
            ),

            SizedBox(height: 20),

            // Product Grid Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text("Popular Products", style: TextStyle(fontSize: 20)),
            ),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 3 / 4,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(
                    title: products[index].title,
                    imageUrl: products[index].imageUrl,
                    price: products[index].price,
                    onAdd: () {
                      setState(() {
                        addToCart(products[index]);
                      });
                    },
                  );
                },
              ),
            ),

            Center(
              child: SizedBox(
                child: Column(
                  children: [
                    Icon(
                      Icons.circle_sharp,
                      size: 10,
                      color: Colors.grey.shade700,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Stay tuned for More",
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ShoppingCart()),
          );
        },
        child: Icon(
          cartList.isEmpty ? Icons.shopping_cart_outlined : Icons.shopping_cart,
        ), // optional: give it a nice icon
      ),
    );
  }

  void addToCart(Product product) {
    final index = cartList.indexWhere(
      (item) => item.product.title == product.title,
    );
    setState(() {
      if (index != -1) {
        //Just increase quantity
        cartList[index].quantity++;
      } else {
        // Add new item
        cartList.add(CartItem(product: product));
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(child: Text("${product.title} added to cart")),
        duration: Duration(seconds: 1),
      ),
    );
  }
}
