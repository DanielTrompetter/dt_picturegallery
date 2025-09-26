import 'package:dt_picturegallery/screens/bigpicture.dart';
import 'package:dt_picturegallery/screens/gallery.dart';
import 'package:dt_picturegallery/screens/profilescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dt_picturegallery/imagesInfo/gallery_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Portrait bleibt, Basta!
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/home': (context) => Galleryscreen(pictures: galleryData),
      '/showpicture': (context) => BigPicture(), 
      '/profile': (context) => ProfileScreen(),
    },
    debugShowCheckedModeBanner: false,
  ));
}


