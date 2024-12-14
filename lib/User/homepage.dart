import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:revaconnect/User/myaccount.dart';
import 'package:revaconnect/User/profile.dart';



class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  final user = FirebaseAuth.instance.currentUser!;

  signout() async {
  await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Image.asset('assets/logo2.png',
        width: 80,
        height: 80,
        fit: BoxFit.cover),
        
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Myaccount()),
            );
            },
          child :
          Image.asset('assets/profile.png'),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(90.0),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              width: 300,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Colors.black,
                width: 2,
                )
              ),
             
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  Icon(Icons.menu, color: Colors.black),
                ],
              ),
            ),
          ),
        ),
      ),
      body:SingleChildScrollView(
        child: 
       Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
            },
            child: 
            CarouselSlider(
              items: [
                Image.asset('assets/logo.png'),
                Image.asset('assets/logo.png'),
                Image.asset('assets/logo.png'),
              ],
              options: CarouselOptions(
                height: 200, // Set the height of the carousel
                aspectRatio: 16/9, // Set the aspect ratio of the carousel
                viewportFraction: 0.8, // Set the fraction of the viewport to display
                initialPage: 0, // Set the initial page
                enableInfiniteScroll: true, // Enable infinite scrolling
                reverse: false, // Set the direction of the carousel
                autoPlay: true, // Enable auto-play
                autoPlayInterval: Duration(seconds: 3), // Set the auto-play interval
                autoPlayAnimationDuration: Duration(milliseconds: 800), // Set the auto-play animation duration
                autoPlayCurve: Curves.fastOutSlowIn, // Set the auto-play curve
                pauseAutoPlayOnTouch: true, // Pause auto-play on touch
                pauseAutoPlayOnManualNavigate: true, // Pause auto-play on manual navigation
                pauseAutoPlayInFiniteScroll: true, // Pause auto-play in infinite scroll
              ),
            ),
            ),
            SizedBox(height: 20.0),
            GestureDetector(
              onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
            },
            child: 
            Container(
              height: 150,
              width: 350,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black,
                width: 1,),
              ),
              child: Text(
                'Technical Events',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ),
            SizedBox(height: 20.0 ),
            GestureDetector(
              onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
            },
            child:
            Container(
              height: 150,
              width: 350,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black,
                width: 1,),
              ),
              child: Text(
                'Cultural Events',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ),
            SizedBox(height: 20.0),
            GestureDetector(
              onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
            },
            child:
            Container(
              height: 150,
              width: 350,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black,
                width: 1,),
              ),
              child: Text(
                'Workshops',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ),
            SizedBox(height: 20.0),
            GestureDetector(
              onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
            },
            child: 
            Container(
              height: 150,
              width: 350,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black,
                width: 1,),
              ),
              child: Text(
                'Literary Events',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ),
          ],
        ),
      ),
    ),),);
  }
}