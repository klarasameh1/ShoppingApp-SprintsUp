import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final VoidCallback onAdd;

  const ProductCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.purple.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 🖼 Improved image container
          Container(
            margin: EdgeInsets.all(10),
            height: 100,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),

          SizedBox(height: 10),
          Text(
            title,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(price),
              Icon(Icons.attach_money ,size: 20,),
            ],
          ),

          IconButton(
            icon: Icon(Icons.add_shopping_cart_outlined),
            onPressed: onAdd,
          ),
        ],
      ),
    );
  }
}
