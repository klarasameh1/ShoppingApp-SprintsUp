
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double price;
  final VoidCallback onAdd;
  final bool showCartIcon;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.onAdd,
    this.showCartIcon = true, // default to true
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext dialogContext) {
            return AlertDialog(
              backgroundColor: Colors.grey.shade200,
              // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              title: Text(title, textAlign: TextAlign.center),
              titleTextStyle: TextStyle(fontSize: 30, color: Color(0xFFB284BE)),

              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    imageUrl,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(height: 15),
                  Center(child: Text("Price: $price EGP", style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold))),
                ],
              ),


              contentTextStyle: TextStyle(
                color: Color(0xFFB284BE),
                fontSize: 20,
              ),

              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Center(
                    widthFactor: 50,
                    child: Text(
                      "OK",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color(0xFFB284BE),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
      child: Container(
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
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SizedBox(height: 8),
            Text(title, textAlign: TextAlign.center),
            SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(price.toString(), style: TextStyle(fontSize: 16)),
                SizedBox(width: 4),
                Text("EGB" , style:TextStyle(fontSize: 14,)),
              ],
            ),
            SizedBox(height: 6),

            if (showCartIcon)
              IconButton(
                icon: Icon(Icons.add_shopping_cart_outlined),
                onPressed: onAdd,
              ),

          ],
        ),
      ),
    );
  }
}
