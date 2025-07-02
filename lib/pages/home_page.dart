import 'package:flutter/material.dart';
import '../widgets/product_card.dart';
import '../widgets/offer_tile.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Map<String, String>> products = [
    {
      'title': 'Skin Care',
      'imageUrl': 'assets/Products/product2.jpg',
    },
    {
      'title': 'Body Mist',
      'imageUrl': 'assets/Products/product3.jpg',
    },
    {
      'title': 'Serum',
      'imageUrl': 'assets/Products/product4.jpg',
    },
    {
      'title': 'Skin care Bundle',
      'imageUrl': 'assets/Products/product5.jpg',
    },
    {
      'title': 'Tonner',
      'imageUrl': 'assets/Products/product6.jpg',
    }
  ];

  final List<String> offers = [
    "🎁 Promo Code: SHOPY25",
    "🚚 Free Shipping",
    "🛍️ Buy 1 Get 1",
    "🔥 Sale 50% Off",
    "💳 Cashback Deal"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Our Products"),
        centerTitle: true,
        backgroundColor: Colors.transparent
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
                  Image.asset('assets/Panners/Panner2.jpg', fit: BoxFit.cover),                ],
              ),
            ),

            SizedBox(height: 20),

            // Product Grid Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Popular Products",
                 style: TextStyle(fontSize: 20),
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                itemCount: 4,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 3 / 4,
                ),
                  itemBuilder: (context, index) {
                    return ProductCard(
                      title: products[index]['title']!,
                      imageUrl: products[index]['imageUrl']!,
                      onAdd: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('${products[index]['title']} added to cart') , showCloseIcon: true,),
                        );
                      },
                    );
                  }
              ),
            ),

            //offers section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "🔥Hot Offers",
                style: TextStyle(fontSize: 20),
              ),
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
          ],
        ),
      ),
    );
  }
}
