import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            textAlign: TextAlign.left,
            'Fitur Stopwatch',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            textAlign: TextAlign.justify,
            'Fitur ini merupakan salah satu fitur di dalam website ini yang berfungsi untuk mencatat waktu atau record time',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            textAlign: TextAlign.left,
            'Cara Menggunakan Stop Watch',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            textAlign: TextAlign.justify,
            'Tombol Start berfungsi untuk memulai pencatatan waktu. '
            'Tombol Stop untuk menghentikan pencatatan waktu. '
            'Tombol Reset untuk memulai pencatatan waktu dari awal. '
            'Tombol Flag saat Start stopwatch dimulai berfungsi untuk mencatatat waktu pada lap tertentu',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            textAlign: TextAlign.left,
            'Carousel Rekomendasi',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            textAlign: TextAlign.justify,
            'Carousel Rekomendasi merupakan koleksi dari tempat-tempat wisata yang direkomendasikan oleh kami'
            'serta menampilkan detail mengenai tempat wisata yang direkomendasikan tersebut',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          //logout button
          Container(
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 50),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.blue[900],
            ),
            child: Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
