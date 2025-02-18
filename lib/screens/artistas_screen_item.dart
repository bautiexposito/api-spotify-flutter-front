import 'dart:math';
import 'package:flutter/material.dart';

class ArtistasScreenItem extends StatelessWidget {
  const ArtistasScreenItem({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final backgroundColor = Theme.of(context).scaffoldBackgroundColor;
    final cardColor = Theme.of(context).cardColor;
    final textColor = Theme.of(context).textTheme.bodyLarge!.color;
    final iconColor = Theme.of(context).iconTheme.color;

    final List<String> imagePaths = [
      'assets/artistas/artista-hombre-1.jpg',
      'assets/artistas/artista-hombre-2.jpg',
      'assets/artistas/artista-hombre-3.jpg',
      'assets/artistas/artista-hombre-4.jpg',
      'assets/artistas/artista-hombre-5.jpg',
      'assets/artistas/artista-mujer-1.jpg',
      'assets/artistas/artista-mujer-2.jpg',
    ];

    final randomImage = imagePaths[Random().nextInt(imagePaths.length)];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          args['name'],
          style: TextStyle(color: textColor),
        ),
      ),
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen del artista
            Container(
              width: double.infinity,
              height: 250,
              color: cardColor,
              child: Center(
                child: Image.asset(
                  randomImage, // Utilizamos la imagen seleccionada aleatoriamente
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.error,
                      size: 50,
                      color: Colors.red,
                    );
                  },
                ),
              ),
            ),
            // Detalles del artista
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    color: cardColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Nombre del artista
                        Text(
                          args['name'],
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: textColor),
                        ),
                        const SizedBox(height: 8),
                        // Oyentes mensuales
                        Text(
                          '${args['listeners']} oyentes mensuales',
                          style: TextStyle(fontSize: 16, color: textColor),
                        ),
                        const SizedBox(height: 8),
                        // Estado de verificacion
                        Text(
                          args['verificado'] ? 'Verificado' : '',
                          style: TextStyle(fontSize: 16, color: Colors.blue),
                        ),
                        const SizedBox(height: 16),
                        // Genero musical
                        Text(
                          '${args['genre']} 100%',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: textColor),
                        ),
                        const SizedBox(height: 16),
                        // Publicado por
                        Row(
                          children: [
                            Icon(Icons.account_circle,
                                size: 40, color: iconColor),
                            const SizedBox(width: 8),
                            Text(
                              'Publicado por ${args['name']}',
                              style:
                                  TextStyle(fontSize: 14, color: textColor),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        // Iconos de redes sociales
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.alternate_email,
                                size: 30, color: iconColor),
                            Icon(Icons.camera_alt, size: 30, color: iconColor),
                            Icon(Icons.facebook, size: 30, color: iconColor),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            label: 'Tu biblioteca',
          ),
        ],
      ),
    );
  }
}
