import 'package:flutter/material.dart';

class RecommendedPlaces extends StatefulWidget {
  const RecommendedPlaces({super.key});

  @override
  State<RecommendedPlaces> createState() => _RecommendedPlacesState();
}

class _RecommendedPlacesState extends State<RecommendedPlaces> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Recommended Places'),
      ),
    );
  }
}
