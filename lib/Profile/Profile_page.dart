import 'package:caffeine_connectfull/cart_page.dart';
import 'package:caffeine_connectfull/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:caffeine_connectfull/Profile/Components/body.dart';

class ProfilePage extends StatefulWidget {
 const ProfilePage({super.key});

 @override
 State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
final List<BottomNavigationBarItem> _navBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.map),
      label: 'Map',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart),
      label: 'Cart',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.account_circle),
      label: 'Profile',
    ),
  ];

  final BottomNavigationBarType _bottomNavType = BottomNavigationBarType.fixed;
  int _selectedIndex = 3;

 @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: const Body(),
       bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xff6200ee),
        unselectedItemColor: const Color(0xff757575),
        type: _bottomNavType,
        onTap: (index) {
          if (index == 2) { // Check if the Cart icon is pressed (index 2)
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartPage()), // Navigate to CartPage
            );
            if (index == 0) { // Check if the Cart icon is pressed (index 2)
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LandingPage()), // Navigate to CartPage
            );
            }
          } else {
            setState(() {
              _selectedIndex = index; // Set the selected index for other icons
            });
          }
        },
        items: _navBarItems,
      ),
      );
 }
}