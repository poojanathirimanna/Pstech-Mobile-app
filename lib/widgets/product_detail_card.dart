import 'package:flutter/material.dart';

class ProductDetailCard extends StatelessWidget {
  final String image;
  final String title;
  final String category;
  final String price;
  final String oldPrice;
  final VoidCallback onAddToCart; // Callback for the add-to-cart button

  ProductDetailCard({
    required this.image,
    required this.title,
    required this.category,
    required this.price,
    required this.oldPrice,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
          ),
          Container(
            color: Colors.grey[800],
            padding: EdgeInsets.all(10.0),
            child: Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '- $category -',
            style: TextStyle(color: Colors.orange, fontSize: 16.0),
          ),
          SizedBox(height: 5),
          Text(
            price,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            oldPrice,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16.0,
              decoration: TextDecoration.lineThrough,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  onAddToCart(); // Call the callback function to handle the add-to-cart logic
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('$title added to cart!'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
                child: Text('Add to Cart'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigate to a detailed product page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailPage(
                        image: image,
                        title: title,
                        category: category,
                        price: price,
                        oldPrice: oldPrice,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[700],
                ),
                child: Text('View More'),
              ),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

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
        backgroundColor: Colors.orange,
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(image),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '- $category -',
                    style: TextStyle(color: Colors.orange, fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    oldPrice,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '14th Gen Intel® Core™ i9 Processor 14900HX Processor NVIDIA® GeForce RTX™ 4080 Laptop GPU 16GB DDR5-5600 SO-DIMM,Max Capacity:64GB 1TB + 1TB PCIe® 4.0 NVMe™ M.2 Performance SSD',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Add to cart logic
                    },
                    child: Text('Add to Cart'),
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
