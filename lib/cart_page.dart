
import 'package:caffeine_connectfull/landing_page.dart';
import 'package:caffeine_connectfull/menu_categories/menu_list_coffee.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final Map<String, dynamic>? selectedItem;

  const CartPage({Key? key, this.selectedItem}) : super(key: key);
  
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  static List<Map<String, dynamic>> cartItems = [];
  
  List<BottomNavigationBarItem> _navBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.map),
      label: 'Map',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart),
      label: 'Cart',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.account_circle),
      label: 'Profile',
    ),
  ];

  BottomNavigationBarType _bottomNavType = BottomNavigationBarType.fixed;
  int _selectedIndex = 2; 
  
  @override
void initState() {
  super.initState();
  if (widget.selectedItem != null) {
    cartItems.add(widget.selectedItem!);
  }
}
  
  @override
  Widget build(BuildContext context) {double totalPrice = 0;
for (var item in cartItems) {
  // Extract the price string and convert it to a double
  double price = double.tryParse(item['price'].replaceAll('\₱', '')) ?? 0;
  totalPrice += price;}

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20.0),
          Text(
            'Your Order',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: cartItems.isEmpty
                ? Center(
                    child: Text('Your cart is empty.'),
                  )
                : ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                cartItems[index]['imagePath'],
                                width: 80.0,
                                height: 80.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 12.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cartItems[index]['name'],
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                if (cartItems[index]['whippedCream'])
                              Text(
                              '+ Whipped Cream',
                              style: TextStyle(
                                color: Colors.grey[600],
                              ),
                            ),
                            if (cartItems[index]['extraMilk'])
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                '+ Extra Milk',
                                style: TextStyle(
                                color: Colors.grey[600],
                                  ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              cartItems[index]['price'],
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.remove_circle),
                              onPressed: () {
                                setState(() {
                                  cartItems.removeAt(index);
                                });
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
          SizedBox(height: 10), // space between text and buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CoffeeMenuPage()));
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: Text(
                  'Add another item',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
      SizedBox(height: 10), // Add space between list and total text
      Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end, 
            children: [
              Text(
                'Total:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold, 
                ),
              ),
              SizedBox(width: 8), // Adjust spacing
              Text(
                '\₱${totalPrice.toStringAsFixed(2)}', // Display total price 
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 20), // Adjust spacing
            ],
          ),
        ),
      ),
      
        SizedBox(height: 10), 
        ElevatedButton(
          onPressed: () {
            // Add functionality 
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.black,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          ),
          child: Text(
            'Choose payment',
            style: TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(height: 20), // Add space between buttons and total text
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0), // Add bottom padding
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Add functionality for Cancel button
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: Text(
                  'Cancel',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Add functionality for Checkout button
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: Text(
                  'Checkout',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
    bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xff6200ee),
        unselectedItemColor: const Color(0xff757575),
        type: _bottomNavType,
        onTap: (index) {
          if (index == 0) { 
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LandingPage()), // Navigate to LandingPage
            );
          }
          if (index == 2) { 
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartPage()), // Navigate to CartPage
            );
          } else {
            setState(() {
              _selectedIndex = index; 
            });
          }
        },
        items: _navBarItems,
      ),
    );
  }
}
  