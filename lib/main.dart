import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
                ),
              ),
              const SizedBox(height: 20.0), 
              MyImageLoader(),
            ],
          ),
        ),
      ),
    );
  }
}

class MyImageLoader extends StatelessWidget {
  const MyImageLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FutureBuilder<void>(
          future: loadImage(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Image.network(
                'https://www.wikinger-reisen.de/bilder/reiseseiten/denali-nationalpark-head4125-t.webp',
                width: 300,
                height: 200,
                fit: BoxFit.cover,
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Fehler beim Laden des Bildes: ${snapshot.error}',
                  style: const TextStyle(color: Colors.red),
                ),
              );
            } else {
              return Center(
                child: Container(
                  width: 300,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Image.network(
                    'https://www.fvw.de/news/media/22/Anchorage-Northern-Lights-Viewing--219909.jpeg',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }
          },
        ),
      ],
    );
  }

  Future<void> loadImage() async {
    await Future.delayed(const Duration(seconds: 2)); // Künstliche Verzögerung von 2 Sekunden
  }
}
