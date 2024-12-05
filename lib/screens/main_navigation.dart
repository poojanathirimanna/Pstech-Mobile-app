import 'package:flutter/material.dart';
import 'home_page.dart';
import 'category_page.dart';
import 'cart_page.dart';
import '../widgets/custom_header.dart'; // Import custom header
import 'package:provider/provider.dart'; // Import Provider package
import '../providers/theme_provider.dart'; // Import ThemeProvider

class MainNavigation extends StatefulWidget {
  final int initialIndex; // Add an initial index parameter for navigation

  MainNavigation({Key? key, this.initialIndex = 0}) : super(key: key);

  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  late int _currentIndex; // Track the selected tab index

  // List of widgets for each tab
  final List<Widget> _pages = [
    HomePage(),
    CategoryPage(category: 'Laptops'), // Example category
    CartPage(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex; // Set initial tab based on the passed index
  }

  // Handle tab changes
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Access ThemeProvider from the provider
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        actions: [
          // Dark mode toggle button
          IconButton(
            icon: Icon(
              themeProvider.themeMode == ThemeMode.dark
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
            onPressed: () {
              // Toggle between light and dark mode
              themeProvider.toggleTheme(themeProvider.themeMode != ThemeMode.dark);
            },
          ),
          // Login button
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/login'); // Navigate to the login page
            },
            child: const Text(
              '',
              style: TextStyle(color: Colors.white),
            ),
          ),
          // Register button
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/register'); // Navigate to the register page
            },
            child: const Text(
              '',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          CustomHeader(), // Add the custom header at the top
          Expanded(
            child: _pages[_currentIndex], // Display the current selected page
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped, // Change tab
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}
