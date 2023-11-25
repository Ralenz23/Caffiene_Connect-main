
import 'package:caffeine_connectfull/cart_page.dart';
import 'package:caffeine_connectfull/landing_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CoffeeMenuPage(),
    );
  }
}

class CoffeeMenuPage extends StatefulWidget {
  const CoffeeMenuPage({Key? key}) : super(key: key);

  @override
  _CoffeeMenuPageState createState() => _CoffeeMenuPageState();
}

class _CoffeeMenuPageState extends State<CoffeeMenuPage> {

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
  int _selectedIndex = 0; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coffee Menu'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          CoffeeMenuItem(
      name: 'Latte',
      description: 'Strong and flavorful coffee',
      price: '\₱160.00',
      imagePath: 'assets/images/menu/order-menu/order-menu-1.jpg',
    ),
    SizedBox(height: 16.0),
    CoffeeMenuItem(
      name: 'Cappuccino',
      description: 'Espresso with frothed milk',
      price: '\₱170.00',
      imagePath: 'assets/images/menu/order-menu/order-menu-2.jpg',
    ),
    SizedBox(height: 16.0),
    CoffeeMenuItem(
      name: 'Espresso',
      description: 'Espresso with steamed milk',
      price: '\₱110.00',
      imagePath: 'assets/images/menu/order-menu/order-menu-3.jpg',
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
              MaterialPageRoute(builder: (context) => LandingPage()), 
            );
          }
          if (index == 2) { 
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartPage()), 
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
    
class CoffeeMenuItem extends StatelessWidget {
  
  final String name;
  final String description;
  final String price;
  final String imagePath;

  const CoffeeMenuItem({
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
  });

  //Container for Vertical MenuList
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: imagePath, 
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  imagePath,
                  width: double.infinity,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 12.0),
            Text(
              name,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              description,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CoffeeDetailPage(
                          name: name,
                          description: description,
                          price: price,
                          imagePath: imagePath,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    'View',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//Inside Menu Item
class CoffeeDetailPage extends StatefulWidget {
  final String name;
  final String description;
  final String price;
  final String imagePath;

  const CoffeeDetailPage({
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
  });

  @override
  _CoffeeDetailPageState createState() => _CoffeeDetailPageState();
}

class _CoffeeDetailPageState extends State<CoffeeDetailPage> {
  // ignore: unused_field
  bool _isChecked1 = false;
  bool _isChecked2 = false;

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
  int _selectedIndex = 0; 
  
  void _addItemToCart() {
  // calculate total price based on selected checkboxes
  double totalPrice = double.parse(widget.price.replaceAll('\₱', ''));
  if (_isChecked1) totalPrice += 10;
  if (_isChecked2) totalPrice += 10;

  // Update description based on selected checkboxes
  String updatedDescription = widget.description;
  if (_isChecked1) updatedDescription += ' with Whipped Cream';
  if (_isChecked2) updatedDescription += ' with Extra Milk';

  // Prepare the updated item
  Map<String, dynamic> updatedItem = {
    'name': widget.name,
    'description': updatedDescription,
    'price': '\₱${totalPrice.toStringAsFixed(2)}',
    'imagePath': widget.imagePath,
    'whippedCream': _isChecked1,
    'extraMilk': _isChecked2,
  };

    Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => CartPage(selectedItem: updatedItem),
    ),
  );


    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${widget.name} added to cart'),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
              child: Image.asset(
                widget.imagePath,
                width: double.infinity,
                height: 350.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.name,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  widget.description,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 4.0), 
    CheckboxListTile(
    contentPadding: EdgeInsets.fromLTRB(0, 8, 0, 0),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Whipped Cream'),
        Text(
          '+ ₱10', // Fixed addOnPrice
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14.0,
          ),
        ),
      ],
    ),
      value: _isChecked1,
      onChanged: (bool? value) {
        setState(() {
          _isChecked1 = value ?? false;
        });
      },
    ),
    CheckboxListTile(
    contentPadding: EdgeInsets.zero,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Extra Milk'),
        Text(
          '+ ₱10', // Fixed addOnPrice
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14.0,
          ),
        ),
      ],
    ),
    value: _isChecked2,
      onChanged: (bool? value) {
        setState(() {
          _isChecked2 = value ?? false;
          });
            },
              ),
              Text(
                  widget.price, // Display the price above the button
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                ElevatedButton(
        onPressed: () {
          _addItemToCart(); // Call the function to add the item to the cart
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: 
          Text(
            'Add to Cart',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
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
              MaterialPageRoute(builder: (context) => LandingPage()), 
            );
          }
          if (index == 2) { 
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartPage()), 
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
    
  

