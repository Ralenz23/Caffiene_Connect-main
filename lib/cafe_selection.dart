import 'package:caffeine_connectfull/landing_page.dart';
import 'package:flutter/material.dart';


class CafeSelectionPage extends StatelessWidget {
  const CafeSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> titles = [
      'Kopilism',
      'Diplo Fleur Cafe',
      'Title: Menu 2',
      'Title: Menu 3',
    ];

    final List<String> descriptions = [
      'Indulge in the perfect balance of creamy and fruity, blended to icy perfection. Satisfy your cravings and embrace the sweetness in every sip!',
      'A cozy spot offering freshly brewed coffees, artisanal teas, and delightful pastries. Known for its inviting ambiance, it\'s the perfect place to relax and enjoy light bites in a serene setting.',
      'Description for Menu 2',
      'Description for Menu 3',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cafe Selection"),
        
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: ListView.builder(
            itemCount: _images.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SecondPage(
                      heroTag: index,
                      title: titles[index],
                      description: descriptions[index],
                    ),
                  ));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Hero(
                        tag: index,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            _images[index],
                            width: 200,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          titles[index],
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final int heroTag;
  final String title;
  final String description;

  const SecondPage({
    super.key,
    required this.heroTag,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Hero(
                tag: heroTag,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(_images[heroTag]),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(4, 30, 4, 4),
              child: Column(
                children: [
                  Text(
                    description,
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(6, 24, 6, 0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const LandingPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: const EdgeInsets.all(16.0),
                        ),
                        child: const Text(
                          'Let\'s Go!',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final List<String> _images = [
  'assets/images/cafe-selection/cafe-selection-logo-kopilism.jpg',
  'assets/images/cafe-selection/cafe-selection-logo-diplo.jpg',
  'assets/images/menu/menu-kopilisim-2.jpg',
  'assets/images/menu/menu-kopilisim-3.jpg',
];
