import 'package:flutter/material.dart';
import '../widgets/product_card.dart';
import '../widgets/offer_tile.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Map<String, String>> products = [
    {
      'title': 'Nail Care',
      'imageUrl': 'https://images.pexels.com/photos/8714494/pexels-photo-8714494.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    },
    {
      'title': 'Skin Care',
      'imageUrl': 'https://images.pexels.com/photos/8101531/pexels-photo-8101531.jpeg',
    },
    {
      'title': 'Hair Care',
      'imageUrl': 'https://images.pexels.com/photos/8468162/pexels-photo-8468162.jpeg',
    },
    {
      'title': 'MakeUp',
      'imageUrl': 'https://images.pexels.com/photos/2533266/pexels-photo-2533266.jpeg',
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
        backgroundColor: Color(0xFFB284BE),
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
                  Image.network('https://images.pexels.com/photos/5632371/pexels-photo-5632371.jpeg?auto=compress', fit: BoxFit.cover),
                  Image.network('https://images.pexels.com/photos/5864150/pexels-photo-5864150.jpeg?auto=compress', fit: BoxFit.cover),
                  Image.network('https://images.pexels.com/photos/5632403/pexels-photo-5632403.jpeg?auto=compress', fit: BoxFit.cover),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Product Grid Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Popular Products",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                          SnackBar(content: Text('${products[index]['title']} added to cart')),
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
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
