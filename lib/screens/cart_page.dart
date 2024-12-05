import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Sample products to display in the cart
  final List<Map<String, String>> sampleProducts = [
    {
      'image': 'assets/images/pro1.png',
      'title': 'Sample Product 1',
      'price': '100,000 LKR',
    },
    {
      'image': 'assets/images/ram2.png',
      'title': 'Sample Product 2',
      'price': '150,000 LKR',
    },
    {
      'image': 'assets/images/lap3.png',
      'title': 'Sample Product 3',
      'price': '200,000 LKR',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Colors.orange,
      ),
      body: sampleProducts.isEmpty
          ? Center(
              child: Text(
                'Your cart is empty.',
                style: TextStyle(fontSize: 20),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: sampleProducts.length,
                    itemBuilder: (context, index) {
                      final item = sampleProducts[index];
                      return ListTile(
                        leading: Image.asset(
                          item['image']!,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                        title: Text(item['title']!),
                        subtitle: Text(item['price']!),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              sampleProducts.removeAt(index);
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle checkout process here
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Proceeding to checkout...'),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                    ),
                    child: Text('Proceed to Checkout'),
                  ),
                ),
              ],
            ),
    );
  }
}
