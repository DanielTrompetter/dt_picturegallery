import 'package:dt_picturegallery/bigpicture.dart';
import 'package:dt_picturegallery/gallery.dart';
import 'package:dt_picturegallery/profilescreen.dart';
import 'package:flutter/material.dart';
import 'package:dt_picturegallery/imagesInfo/gallery_data.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/home': (context) => GalleryScreen(pictures: galleryData),
      '/showpicture': (context) => BigPicture(), 
      '/profile': (context) => ProfileScreen(),
    },
    debugShowCheckedModeBanner: false,
  ));
}


