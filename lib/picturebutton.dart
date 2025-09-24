import 'package:flutter/material.dart';

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