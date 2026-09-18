import 'package:flutter/material.dart';
import 'constants.dart';

class Productcard2 extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final String category;
  final int rating;
  final bool sale;

  const Productcard2({
    required this.image,
    required this.title,
    required this.price,
    required this.rating,
    required this.category,
    this.sale = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(paddingSize),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F6F2),
        borderRadius: BorderRadius.circular(cardRadius),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  image,
                  height: imageHeight,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              if (sale)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      'SALE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),

          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),

          const SizedBox(height: 8),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              category,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),

          const SizedBox(height: 8),

          Row(
            children: List.generate(5, (index) {
              final isFilled = index < rating;
              return Icon(
                isFilled ? Icons.star : Icons.star_border,
                size: 16,
                color: isFilled ? Colors.amber : Colors.grey,
              );
            }),
          ),

          const SizedBox(height: 8),

          Text(
            price,
            style: const TextStyle(
              fontSize: 14,
              color: priceColor,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 8),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Купить'),
            ),
          ),

          const SizedBox(height: 8),

          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {},
              child: const Text('В избранное'),
            ),
          ),
        ],
      ),
    );
  }
}
