import 'package:flutter/material.dart';
import '../widgets/product_card.dart';
import 'main_navigation.dart'; // Import main navigation to switch tabs

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key); // Use const constructor for StatelessWidget

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: orientation == Orientation.portrait
                  ? _buildPortraitLayout(context)
                  : _buildLandscapeLayout(context),
            ),
          );
        },
      ),
    );
  }

  // Method to build layout for portrait orientation
  Widget _buildPortraitLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
          child: Text(
            'Welcome to PSTech',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: ElevatedButton(
            onPressed: () {
              // Switch to the Categories tab in the bottom navigation
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MainNavigation(
                    initialIndex: 1, // Set the initial tab index for Categories
                  ),
                ),
              );
            },
            child: const Text('Explore Products'),
          ),
        ),
        const SizedBox(height: 20),
        buildFeaturedProducts(isPortrait: true),
        const SizedBox(height: 20),
        buildSpecialOffers(isPortrait: true),
      ],
    );
  }

  // Method to build layout for landscape orientation
  Widget _buildLandscapeLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  'Welcome to PSTech',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Switch to the Categories tab in the bottom navigation
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainNavigation(
                          initialIndex: 1,
                        ),
                      ),
                    );
                  },
                  child: const Text('Explore Products'),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              buildFeaturedProducts(isPortrait: false),
              const SizedBox(height: 20),
              buildSpecialOffers(isPortrait: false),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildFeaturedProducts({required bool isPortrait}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Featured Products',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: isPortrait ? 200 : 150, // Adjust height for portrait/landscape
          child: ListView(
            scrollDirection: isPortrait ? Axis.horizontal : Axis.vertical,
            children: [
              ProductCard(
                image: 'assets/images/asusproart.jpg',
                name: 'ASUS ProArt',
                price: '50,000 LKR',
              ),
              ProductCard(
                image: 'assets/images/msicybog.jpg',
                name: 'MSI Cyborg',
                price: '250,000 LKR',
              ),
              ProductCard(
                image: 'assets/images/msimonitor.jpg',
                name: 'MSI Monitor',
                price: '45,000 LKR',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildSpecialOffers({required bool isPortrait}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Special Offers',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: isPortrait ? 200 : 150, // Adjust height for portrait/landscape
          child: ListView(
            scrollDirection: isPortrait ? Axis.horizontal : Axis.vertical,
            children: [
              ProductCard(
                image: 'assets/images/ROG.jpg',
                name: 'Rog Strix ',
                price: '700,000 LKR',
              ),
              ProductCard(
                image: 'assets/images/ROG2.jpg',
                name: 'Rog Strix 2',
                price: '675,000 LKR',
              ),
              ProductCard(
                image: 'assets/images/I9.jpg',
                name: 'Lenovo ThinkPad',
                price: '480,000 LKR',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
