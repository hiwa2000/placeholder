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
          child: MyImageLoader(),
        ),
      ),
    );
  }
}

class MyImageLoader extends StatelessWidget {
  const MyImageLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: loadImage(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // Wenn der Ladevorgang abgeschlossen ist, zeige das Bild an
          return Image.network(
            'https://www.wikinger-reisen.de/bilder/reiseseiten/nonexistent_image.webp', // Hier verwenden wir eine falsche URL, um einen Fehler zu provozieren
            width: 300,
            height: 200,
            fit: BoxFit.cover,
          );
        } else if (snapshot.hasError) {
          // Wenn ein Fehler auftritt, zeige den Error-Zustand an
          return Center(
            child: Text(
              'Fehler beim Laden des Bildes: ${snapshot.error}',
              style: TextStyle(color: Colors.red),
            ),
          );
        } else {
          // Wenn das Bild noch lädt, zeige den Fortschrittsindikator an
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Future<void> loadImage() async {
    // Hier provozieren wir einen Fehler, indem wir versuchen, ein nicht vorhandenes Bild zu laden
    throw 'Simulierter Fehler: Bild konnte nicht geladen werden';
  }
}
