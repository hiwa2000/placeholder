import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Alaska Landscape",
                style: TextStyle(
                  fontSize: 24.0, 
                  fontWeight: FontWeight.bold, 
                  fontFamily: 'Arial', 
                  color: Colors.blue, 
                ),
              ),
              SizedBox(height: 20.0), // Füge mehr Abstand hinzu
              MyImageLoader(),
            ],
          ),
        ),
      ),
    );
  }
}

class MyImageLoader extends StatelessWidget {
  const MyImageLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          'https://www.wikinger-reisen.de/bilder/reiseseiten/denali-nationalpark-head4125-t.webp',
          width: 300, // Setze die Breite nach Bedarf
          height: 200, // Setze die Höhe nach Bedarf
          fit: BoxFit.cover,
          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          },
        ),
      ],
    );
  }
}
