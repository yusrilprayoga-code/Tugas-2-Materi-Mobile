import 'package:Layout_Flutter/Pages/customShap.dart';
import 'package:Layout_Flutter/Pages/details_group.dart';
import 'package:Layout_Flutter/Pages/help_us.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 130,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.black,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        flexibleSpace: ClipPath(
          clipper: customShape(),
          child: Container(
            height: 350,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text(
                'KELOMPOK 6',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.purple],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ),
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: CarouselSlider(
                    items: [
                      InkWell(
                        onTap: () => showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return detailsGroup(0, context);
                          },
                        ),
                        child: Container(
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'assets/images/yusril.jpg',
                              fit: BoxFit.cover,
                              filterQuality: FilterQuality.high,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return detailsGroup(1, context);
                          },
                        ),
                        child: Container(
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'assets/images/daffa.jpg',
                              fit: BoxFit.cover,
                              filterQuality: FilterQuality.high,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return detailsGroup(2, context);
                          },
                        ),
                        child: Container(
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'assets/images/3.jpg',
                              fit: BoxFit.cover,
                              filterQuality: FilterQuality.high,
                            ),
                          ),
                        ),
                      ),
                      // Tambahkan Item Carousel Lainnya
                    ],
                    options: CarouselOptions(
                      height: 300,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.55,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Isi konten di sini...',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ],
            ),
          ),
          // Widget currentpage untuk Help Us
          HelpPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'Help Us',
          ),
        ],
      ),
    );
  }
}
