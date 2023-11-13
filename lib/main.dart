import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

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
          child: MyImageLoader(),
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
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: 300,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
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
