import 'package:flutter/material.dart';
import '../services/artistasService.dart';
import '../model/artistas.dart';

class ArtistasScreen extends StatefulWidget {
  const ArtistasScreen({super.key});

  @override
  State<ArtistasScreen> createState() => _ArtistasScreenState();
}

class _ArtistasScreenState extends State<ArtistasScreen> {
  late Future<List<Artista>> artistas;

  @override
  void initState() {
    super.initState();
    artistas = ApiService().getArtistas();
  }

  @override
  Widget build(BuildContext context) {
    final cardColor = Theme.of(context).cardColor;
    final textColor = Theme.of(context).textTheme.bodyLarge!.color;
    final iconColor = Theme.of(context).iconTheme.color;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Artistas',
          style: TextStyle(color: textColor),
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: FutureBuilder<List<Artista>>(
        future: artistas,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No se encontraron artistas.'));
          } else {
            final artistas = snapshot.data!;
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: artistas.length,
              itemBuilder: (BuildContext context, int index) {
                final artista = artistas[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      'artistas_screen_item',
                      arguments: <String, dynamic>{
                        'image': 'assets/artistas/pink-logo-spotify.png',
                        'name': artista.nombre,
                        'genre': artista.genero,
                        'listeners': 1000,
                        'verificado': true,
                      },
                    );
                  },
                  child: Container(
                    height: 100,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 5),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/artistas/pink-logo-spotify.png',
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.error,
                              size: 50,
                              color: Colors.red,
                            );
                          },
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                artista.nombre,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: textColor,
                                ),
                              ),
                              Text(
                                artista.genero,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: textColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.star,
                          color: iconColor,
                        ),
                        Text(
                          '1000',
                          style: TextStyle(color: textColor),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
