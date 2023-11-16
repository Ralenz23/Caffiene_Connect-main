import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

late final PageController pageController;

  @override
  void initState() {
    pageController = PageController()
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 250,
            child: PageView.builder(
              controller: pageController,
              itemBuilder: (_,index){
              return AnimatedBuilder(animation: pageController, builder: (ccx, child){
                return child!;
              },
          
              child: Container(
                height: 200,
                color: Colors.amberAccent,
              ),
              );
            }, itemCount: 5,),
          )
        ],),
    );
  }
}