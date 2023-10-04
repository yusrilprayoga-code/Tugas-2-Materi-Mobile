import 'package:Layout_Flutter/Pages/customShap.dart';
import 'package:Layout_Flutter/Pages/details_group.dart';
import 'package:Layout_Flutter/Pages/help_us.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:async';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  int second = 0, minute = 0, hour = 0;
  String digitsecond = "00", digitminute = "00", digithour = "00";
  Timer? timer;
  bool started = false;
  List laps = [];

  void stop() {
    timer!.cancel();
    setState(() {
      started = false;
    });
  }

  void reset() {
    timer!.cancel();
    setState(() {
      second = 0;
      minute = 0;
      hour = 0;

      digitsecond = "00";
      digitminute = "00";
      digithour = "00";

      started = false;
    });
  }

  void addlaps() {
    if (second + minute + hour > 1) {
      String lap = "$digithour:$digitminute:$digitsecond";
      setState(() {
        laps.add(lap);
      });
    }
  }

  void start() {
    started = true;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      int localsecond = second + 1;
      int localminute = minute;
      int localhour = hour;

      if (localsecond > 59) {
        if (localminute > 59) {
          localhour++;
          localminute = 0;
        } else {
          localminute++;
          localsecond = 0;
        }
      }
      setState(() {
        hour = localhour;
        minute = localminute;
        second = localsecond;

        digitsecond = (second >= 10) ? "$second" : "0$second";
        digitminute = (minute >= 10) ? "$minute" : "0$minute";
        digithour = (hour >= 10) ? "$hour" : "0$hour";
      });
    });
  }

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
                dataKelompok(),
                SizedBox(
                  height: 20,
                ),
                stopWatch(),
                SizedBox(
                  height: 20,
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

  Widget dataKelompok() {
    return Column(children: [
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
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    ]);
  }

  Widget stopWatch() {
    return Column(
      children: [
        SizedBox(
          height: 40,
        ),
        Center(
          
          child: Text(
            "Menu Stopwatch",
            style: TextStyle(
                color: Colors.blue,
                fontSize: 28.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        
        Center(
          child: Text(
            "$digithour:$digitminute:$digitsecond",
            style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w600,
                fontSize: 83.0),
          ),
        ),
        Container(
            height: 400.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.purple],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ),
            ),
            child: ListView.builder(
              itemCount: laps.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Lap no ${index + 1}",
                        style: TextStyle(color: Colors.white, fontSize: 16.0,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "${laps[index]}",
                        style: TextStyle(color: Colors.white, fontSize: 16.0,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                );
              },
            )),
        SizedBox(
          height: 20.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: RawMaterialButton(
              onPressed: () {
                (!started) ? start() : stop();
              },
              shape: const StadiumBorder(
                side: BorderSide(color: Colors.blue),
              ),
              child: Text(
                (!started) ? "Start" : "Stop",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
              ),
            )),
            IconButton(
              onPressed: () {
                addlaps();
              },
              icon: Icon(Icons.flag),
              color: Colors.black,
            ),
            SizedBox(
              width: 8.0,
            ),
            Expanded(
                child: RawMaterialButton(
              fillColor: Colors.blue,
              onPressed: () {
                reset();
              },
              shape: const StadiumBorder(),
              child: Text(
                "Reset",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ))
          ],
        )
      ],
    );
  }
}
