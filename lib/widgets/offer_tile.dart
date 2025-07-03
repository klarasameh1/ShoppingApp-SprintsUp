import 'package:flutter/material.dart';

class OfferTile extends StatelessWidget {
  final String label;

  const OfferTile({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.5,

      margin: EdgeInsets.symmetric(horizontal: 8),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color(0xFFB284BE),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Center(
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}
