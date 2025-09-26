import 'package:dt_picturegallery/screens/bigpicture_screen.dart';
import 'package:dt_picturegallery/screens/gallery_screen.dart';
import 'package:dt_picturegallery/screens/profile_screen.dart';
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
      '/home': (context) => GalleryScreen(pictures: galleryData),
      '/showpicture': (context) => BigPictureScreen(), 
      '/profile': (context) => ProfileScreen(),
    },
    debugShowCheckedModeBanner: false,
  ));
}


