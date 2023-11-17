import 'dart:async';

import 'package:flutter/material.dart';



class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}


class _LandingPageState extends State<LandingPage> {
  late final PageController pageController;
  int pageNo = 0;
  int itemCount = 10000; // Set a large number for infinite looping

  //Bottom Navigation Bar Items
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
      label: 'Search',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.account_circle),
      label: 'Profile',
    ),
  ];

  BottomNavigationBarType _bottomNavType = BottomNavigationBarType.fixed;
  int _selectedIndex = 0; // Added _selectedIndex variable

  Timer? carouselTimer;

  Timer getTimer() {
    return Timer.periodic(const Duration(seconds: 3), (timer) {
      pageController.nextPage(
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOutCirc,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: 5000,
      viewportFraction: 0.85,
    );
    carouselTimer = getTimer();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.red),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),

      //Contains Image Carousel Slider
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(top: 50),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 230,
                          child: PageView.builder(
                            controller: pageController,
                            onPageChanged: (index) {
                              setState(() {
                                pageNo = index % 5;
                              });
                            },
                            itemBuilder: (_, index) {
                              return GestureDetector(
                                onTap: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content:
                                          Text("Hello, you tapped at $index"),
                                    ),
                                  );
                                },
                                onPanDown: (_) {
                                  carouselTimer?.cancel();
                                  carouselTimer = null;
                                },
                                onPanCancel: () {
                                  carouselTimer = getTimer();
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(12.0),
                                  height: 180,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24.0),
                                    color: Colors.grey.shade300,
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/carousel/carousel-placeholder-${index % 5}.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            itemCount: itemCount,
                          ),
                        ),
                        const SizedBox(height: 12.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            5,
                            (index) => Container(
                              margin: const EdgeInsets.all(2.0),
                              child: Icon(
                                Icons.circle,
                                size: 12.0,
                                color: pageNo == index
                                    ? Colors.indigoAccent
                                    : Colors.grey.shade300,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 2.0),
                  // Texts
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 0, 8),
                    child: Row(
                       mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Brief description",
                                      style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "Indulge in the perfect balance of creamy and fruity, blended \nto icy perfection. Satisfy your cravings and embrace the \nsweetness in every sip!",
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                      "Signature Brews",
                                      style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  //Bullet list
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                        TextSpan(
                                        text: "\u2022 Iced Latte Macchiato\n",
                                          style: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: 16,
                                            ),
                                          ),
                                          TextSpan(
                                            text: "\u2022 Cold Brew Float\n",
                                            style: TextStyle(
                                              color: Colors.grey.shade600,
                                              fontSize: 16,
                                            ),
                                          ),
                                          TextSpan(
                                            text: "\u2022 Maple Oat Milk Latte",
                                            style: TextStyle(
                                              color: Colors.grey.shade600,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          //menu category image listview
          Container(
            child: 
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 3,
              ),
            ],
                  ),
                  child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 160, // Set your desired height
                  child: Center(
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        // Add your images in a horizontal ListView
                        // Example: Image.asset('assets/images/image1.jpg'),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(28, 0, 4, 6),
                          child: Image.asset('assets/images/menu/menu-kopilisim-1.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(4, 0, 4, 6),
                          child: Image.asset('assets/images/menu/menu-kopilisim-2.jpg'),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(4, 0, 28, 6),
                          child: Image.asset('assets/images/menu/menu-kopilisim-3.jpg'),
                        ),
                        // ...
                      ],
                    ),
                  ),
                ),
              ), 
            ], 
                  ),
                ),
              ),
          ),
          
          //top greeting text
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Good Morning Keannu!",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      
      //Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xff6200ee),
        unselectedItemColor: const Color(0xff757575),
        type: _bottomNavType,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: _navBarItems,
      ),
    );
  }
}

