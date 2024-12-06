class User {
  final int? id;
  final String email;
  final String password;

  User({this.id, required this.email, required this.password});

  // Convertir un usuario a un mapa para guardar en SQLite
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'password': password,
    };
  }

  // Crear un usuario desde un mapa (por ejemplo, recuperado de SQLite)
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      email: map['email'],
      password: map['password'],
    );
  }
}
