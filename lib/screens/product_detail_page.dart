import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final String image;
  final String title;
  final String category;
  final String price;
  final String oldPrice;

  ProductDetailPage({
    required this.image,
    required this.title,
    required this.category,
    required this.price,
    required this.oldPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Image.asset(image, width: double.infinity, height: 300, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Title
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  // Product Category
                  Text(
                    '- $category -',
                    style: TextStyle(color: Colors.orange, fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  // Product Price
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Old Price
                  Text(
                    oldPrice,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Product Description
                  Text(
                    ' i9 DDR5 64 GB RAM , RTX4090.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  // Add to Cart Button
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Add to cart logic
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('$title added to cart!'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      ),
                      child: Text('Add to Cart'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
