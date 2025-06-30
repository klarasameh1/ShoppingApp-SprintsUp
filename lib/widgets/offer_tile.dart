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
      width: 180,
      margin: EdgeInsets.symmetric(horizontal: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFD7C1DD),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}
