import 'package:flutter/material.dart';
import '../widgets/product_detail_card.dart'; // Import the custom product detail card widget

class CategoryPage extends StatelessWidget {
  final String category;

  const CategoryPage({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange, // Adjust the app bar color
          title: Text('Categories'),
          bottom: TabBar(
            indicatorColor: Colors.white, // Tab indicator color
            tabs: [
              Tab(text: 'Laptops'),
              Tab(text: 'RAMs'),
              Tab(text: 'Processors'),
              Tab(text: 'Graphic Cards'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildCategoryContent('Laptops', context),
            _buildCategoryContent('RAMs', context),
            _buildCategoryContent('Processors', context),
            _buildCategoryContent('Graphic Cards', context),
          ],
        ),
      ),
    );
  }

  // Method to build category content for each tab
  Widget _buildCategoryContent(String category, BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Display three products for each category
            if (category == 'Laptops') ...[
              ProductDetailCard(
                image: 'assets/images/lap1.png',
                title: 'ASUS ROG Strix SCAR 16 (2024) G634JZR i9 14TH GEN RTX 4080',
                category: category,
                price: '1,589,000 LKR',
                oldPrice: '1,599,000 LKR',
                onAddToCart: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('ASUS ROG Strix SCAR 16 added to cart!')),
                  );
                },
              ),
              ProductDetailCard(
                image: 'assets/images/lap2.png',
                title: 'Dell XPS 13 (2023) Intel Core i7',
                category: category,
                price: '450,000 LKR',
                oldPrice: '480,000 LKR',
                onAddToCart: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Dell XPS 13 added to cart!')),
                  );
                },
              ),
              ProductDetailCard(
                image: 'assets/images/lap3.png',
                title: 'MacBook Pro 14-inch M1 Pro',
                category: category,
                price: '790,000 LKR',
                oldPrice: '820,000 LKR',
                onAddToCart: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('MacBook Pro added to cart!')),
                  );
                },
              ),
            ] else if (category == 'RAMs') ...[
              ProductDetailCard(
                image: 'assets/images/ram1.png',
                title: 'Corsair Vengeance 16GB DDR4',
                category: category,
                price: '25,000 LKR',
                oldPrice: '28,000 LKR',
                onAddToCart: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Corsair Vengeance added to cart!')),
                  );
                },
              ),
              ProductDetailCard(
                image: 'assets/images/ram2.png',
                title: 'G.SKILL Trident Z Royal 32GB DDR4',
                category: category,
                price: '45,000 LKR',
                oldPrice: '48,000 LKR',
                onAddToCart: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('G.SKILL Trident Z Royal added to cart!')),
                  );
                },
              ),
              ProductDetailCard(
                image: 'assets/images/ram3.png',
                title: 'Kingston HyperX Fury 8GB DDR4',
                category: category,
                price: '12,000 LKR',
                oldPrice: '14,000 LKR',
                onAddToCart: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Kingston HyperX Fury added to cart!')),
                  );
                },
              ),
            ] else if (category == 'Processors') ...[
              ProductDetailCard(
                image: 'assets/images/pro1.png',
                title: 'Intel Core i9 12th Gen Processor',
                category: category,
                price: '120,000 LKR',
                oldPrice: '135,000 LKR',
                onAddToCart: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Intel Core i9 added to cart!')),
                  );
                },
              ),
              ProductDetailCard(
                image: 'assets/images/pro2.png',
                title: 'AMD Ryzen 9 5900X',
                category: category,
                price: '110,000 LKR',
                oldPrice: '125,000 LKR',
                onAddToCart: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('AMD Ryzen 9 added to cart!')),
                  );
                },
              ),
              ProductDetailCard(
                image: 'assets/images/pro3.png',
                title: 'Intel Core i7 11th Gen Processor',
                category: category,
                price: '95,000 LKR',
                oldPrice: '105,000 LKR',
                onAddToCart: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Intel Core i7 added to cart!')),
                  );
                },
              ),
            ] else if (category == 'Graphic Cards') ...[
              ProductDetailCard(
                image: 'assets/images/vga1.png',
                title: 'NVIDIA RTX 3080 10GB GDDR6X',
                category: category,
                price: '320,000 LKR',
                oldPrice: '350,000 LKR',
                onAddToCart: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('NVIDIA RTX 3080 added to cart!')),
                  );
                },
              ),
              ProductDetailCard(
                image: 'assets/images/vga2.png',
                title: 'AMD Radeon RX 6800 XT',
                category: category,
                price: '290,000 LKR',
                oldPrice: '315,000 LKR',
                onAddToCart: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('AMD Radeon RX 6800 XT added to cart!')),
                  );
                },
              ),
              ProductDetailCard(
                image: 'assets/images/vga3.png',
                title: 'NVIDIA RTX 3070 8GB GDDR6',
                category: category,
                price: '250,000 LKR',
                oldPrice: '270,000 LKR',
                onAddToCart: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('NVIDIA RTX 3070 added to cart!')),
                  );
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}
