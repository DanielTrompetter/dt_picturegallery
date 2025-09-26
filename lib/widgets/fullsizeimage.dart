import 'package:flutter/material.dart';

//helper Klasse mitsamt Screen für das zoombare Bild
class FullSizeImageScreen extends StatelessWidget {
  final String imagePath;
  final String imageTitle;
  const FullSizeImageScreen({super.key, required this.imagePath, required this.imageTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(imageTitle)),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(imagePath),
            ),
          ),
        ),
      ),
    );
  }
}
