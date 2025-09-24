import 'package:dt_picturegallery/galleryitem.dart';
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
          if (index == 0) {
            Navigator.pushNamed(context, '/');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/profile');
          }
        },
        selectedIndex: navbarindex,
      ),
    );
  }
}

class PictureButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String imagePath;
  final String label;
  const PictureButton({
    super.key,
    required this.onPressed,
    required this.imagePath,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 200, //feste Höhe für den Button weil sonst wilde Fehler!
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                height: 40,
                alignment: Alignment.center,
                child: Text(
                  label,
                  style: Theme.of(context).textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
