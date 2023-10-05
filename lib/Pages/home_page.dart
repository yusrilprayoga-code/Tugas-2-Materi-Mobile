import 'package:Layout_Flutter/Pages/Details_Travel.dart';
import 'package:Layout_Flutter/Pages/customShap.dart';
import 'package:Layout_Flutter/Pages/details_group.dart';
import 'package:Layout_Flutter/Pages/help_us.dart';
import 'package:Layout_Flutter/constants/tourism_place.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

enum SortType {
  nameAscending,
  nameDescending,
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  int _currentIndex = 0;
  SortType currentSortType = SortType.nameAscending;
  bool isFavorite = false;
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
    tourismPlaceList.sort((a, b) {
      if (currentSortType == SortType.nameAscending) {
        return a.name.compareTo(b.name);
      } else if (currentSortType == SortType.nameDescending) {
        return b.name.compareTo(a.name);
      }
      return 0;
    });

    return Scaffold(
      key: scaffoldMessengerKey,
      appBar: AppBar(
        toolbarHeight: 100,
        toolbarOpacity: 0.5,
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
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Recommended Places",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (currentSortType == SortType.nameAscending) {
                              currentSortType = SortType.nameDescending;
                            } else {
                              currentSortType = SortType.nameAscending;
                            }
                          });
                        },
                        icon: Icon(
                          Icons.filter_list,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                //listview builder
                Container(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: tourismPlaceList.length,
                    itemBuilder: (context, index) {
                      final TourismPlace place = tourismPlaceList[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailsScreen(
                                        place: place,
                                      )));
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 20),
                          width: 150,
                          child: Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      place.imageUrls[0],
                                      width: 150,
                                      height: 100,
                                      fit: BoxFit.cover,
                                      filterQuality: FilterQuality.high,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    place.name,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  GestureDetector(
                                    onTap: () {
                                      _launchInBrowser(place.imageUrls[0]);
                                    },
                                    child: Text(
                                      place.imageUrls[0],
                                      style: TextStyle(
                                        fontSize: 9,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                top: 5,
                                right: 5,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.favorite,
                                    color: place.isFavorite
                                        ? Colors.red
                                        : Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      place.isFavorite = !place
                                          .isFavorite; // Toggle the favorite status.
                                    });
                                    final snackBar = SnackBar(
                                      content: Text(place.isFavorite
                                          ? 'Added to Favorites'
                                          : 'Removed from Favorites'),
                                    );
                                    scaffoldMessengerKey.currentState
                                        ?.showSnackBar(snackBar);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
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

  Future<void> _launchInBrowser(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Failed to open link: $_url');
    }
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
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        Center(
          child: Text(
            "$digithour:$digitminute:$digitsecond",
            style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w600,
                fontSize: 50.0),
          ),
        ),
        Container(
            height: 300.0,
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
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "${laps[index]}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
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
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
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
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ))
          ],
        )
      ],
    );
  }
}
