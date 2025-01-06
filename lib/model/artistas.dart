class Artista {
  final String id;
  final String nombre;
  final String fechaDeNacimiento;
  final String genero;
  final String cancionHit;

  Artista({
    required this.id,
    required this.nombre,
    required this.fechaDeNacimiento,
    required this.genero,
    required this.cancionHit,
  });

  factory Artista.fromJson(Map<String, dynamic> json) {
    return Artista(
      id: json['id'],
      nombre: json['nombre'],
      fechaDeNacimiento: json['fechaDeNacimiento'],
      genero: json['genero'],
      cancionHit: json['cancionHit'],
    );
  }
}
