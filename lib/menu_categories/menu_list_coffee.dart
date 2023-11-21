import 'package:caffeine_connectfull/landing_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const CoffeeMenuPage(),
    );
  }
}

class CoffeeMenuPage extends StatefulWidget {
  const CoffeeMenuPage({Key? key}) : super(key: key);

  @override
  _CoffeeMenuPageState createState() => _CoffeeMenuPageState();
}

class _CoffeeMenuPageState extends State<CoffeeMenuPage> {
  int _selectedIndex = 0;

//BottomNavigationBar
  final List<Widget> _pages = [
    const LandingPage(), // For home widget (BottomNavigationBar)
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coffee Menu'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          CoffeeMenuItem(
      name: 'Latte',
      description: 'Strong and flavorful coffee',
      price: '₱160',
      imagePath: 'assets/images/menu/order-menu/order-menu-1.jpg',
    ),
    SizedBox(height: 16.0),
    CoffeeMenuItem(
      name: 'Cappuccino',
      description: 'Espresso with frothed milk',
      price: '₱170',
      imagePath: 'assets/images/menu/order-menu/order-menu-2.jpg',
    ),
    SizedBox(height: 16.0),
    CoffeeMenuItem(
      name: 'Espresso',
      description: 'Espresso with steamed milk',
      price: '₱110',
      imagePath: 'assets/images/menu/order-menu/order-menu-3.jpg',
    ),
  ],
),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xff6200ee),
        unselectedItemColor: const Color(0xff757575),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });

          // Navigate to the respective page based on index
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => _pages[index]),
          );
        },
        items: const [
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
        ],
      ),
    );
  }
}
    
class CoffeeMenuItem extends StatelessWidget {
  
  final String name;
  final String description;
  final String price;
  final String imagePath;

  const CoffeeMenuItem({super.key, 
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
        padding: const EdgeInsets.all(12.0),
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
            const SizedBox(height: 12.0),
            Text(
              name,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              description,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  price,
                  style: const TextStyle(
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
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
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

  const CoffeeDetailPage({super.key, 
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
  });

  @override
  _CoffeeDetailPageState createState() => _CoffeeDetailPageState();
}

class _CoffeeDetailPageState extends State<CoffeeDetailPage> {
  int _selectedIndex = 0; 
  bool _isChecked1 = false;
  bool _isChecked2 = false;

  final List<Widget> _pages = [
    const LandingPage(), // Home page
    
  ];

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
                  offset: const Offset(0, 3),
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
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.name,
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  widget.description,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4.0), 
                CheckboxListTile(
                  contentPadding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                  title: const Text('Whipped Cream'),
                  value: _isChecked1,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked1 = value ?? false;
                    });
                  },
                ),
                const SizedBox(height: 0.0), 
                CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Extra Milk'),
                  value: _isChecked2,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked2 = value ?? false;
                    });
                  },
                ),
                const SizedBox(height: 8.0),
                Text(
                  widget.price,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: () {
                    // Add 'Add to Cart' logic here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
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
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });

          // Navigate to the respective page based on index
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => _pages[index]),
          );
        },
        items: const [
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
        ],
      ),
    );
  }
}
    
  

