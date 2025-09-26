import 'package:dt_picturegallery/widgets/fullsizeimage.dart';
import 'package:dt_picturegallery/widgets/galleryitem.dart';
import 'package:flutter/material.dart';

class BigPictureScreen extends StatelessWidget {
  const BigPictureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)!.settings.arguments as GalleryItem;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Zurück-Button oben links
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton.icon(
                icon: const Icon(Icons.arrow_back),
                label: const Text('Zur Galerie'),
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.primary,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
              ),
            ),

            // Klickbares Bild
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FullSizeImageScreen(
                      imagePath: item.imagePath,
                      imageTitle: item.imageTitle,
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  item.imagePath,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            // Titel und Datum
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Text(
                    item.imageTitle,
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.imageDate,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Beschreibung (scrollbar bei Überlänge)
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                child: Text(
                  item.imageDescription,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
