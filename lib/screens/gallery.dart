import 'package:dt_picturegallery/widgets/galleryitem.dart';
import 'package:dt_picturegallery/widgets/picturebutton.dart';
import 'package:flutter/material.dart';

class GalleryScreen extends StatelessWidget {
  final List<GalleryItem>? pictures; 
  GalleryScreen({super.key, required this.pictures});

  int navbarindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meine Bilder')),
      body: ListView.builder(
        itemCount: pictures?.length != null? pictures!.length ~/ 2 : 0, // 2 Bilder pro Zeile!
        itemBuilder: (context, index) {
        int picnumber = index * 2;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              children: [
                PictureButton(
                  imagePath: pictures![picnumber].imagePath, 
                  label: pictures![picnumber].imageTitle,
                  onPressed: () { 
                      Navigator.pushNamed(
                      context,
                      '/showpicture',
                      arguments: pictures![picnumber],
                    );
                  }, 
                ),
                const SizedBox(width: 16),
                PictureButton(
                  imagePath: pictures![picnumber+1].imagePath, 
                  label: pictures![picnumber+1].imageTitle,
                  onPressed: () { 
                      Navigator.pushNamed(
                      context,
                      '/showpicture',
                      arguments: pictures![picnumber+1],
                    );
                  }, 
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Profile'),
        ],
        onDestinationSelected: (index) {
          navbarindex = index;
          if (index == 1) {
            Navigator.pushNamed(context, '/profile');
          }
        },
        selectedIndex: navbarindex,
      ),
    );
  }
}


