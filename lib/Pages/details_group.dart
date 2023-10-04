import 'package:flutter/material.dart';

@override
AlertDialog detailsGroup(int itemIndex, BuildContext context) {
  return AlertDialog(
    title: Text('Image Info'),
    content: SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(
            itemIndex == 0
                ? 'assets/images/yusril.jpg'
                : itemIndex == 1
                    ? 'assets/images/daffa.jpg'
                    : 'assets/images/3.jpg',
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            itemIndex == 0
                ? 'MOH. YUSRIL PRAYOGA'
                : itemIndex == 1
                    ? 'DAFFA ADITYA PRANUGRAHA'
                    : 'JEREMY KENNETH HARNANTO',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            itemIndex == 0
                ? 'NIM : 124210006'
                : itemIndex == 1
                    ? 'NIM : 124210021'
                    : 'NIM : 124210007',
            style: TextStyle(fontSize: 15),
          )
        ],
      ),
    ),
    actions: [
      TextButton(
        onPressed: () {
          Navigator.of(context).pop(); // Close the dialog
        },
        child: Text('Close'),
      ),
    ],
  );
}
