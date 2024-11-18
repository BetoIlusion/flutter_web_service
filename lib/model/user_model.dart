import 'package:sqflite/sqflite.dart';
import '../DbHelper/db_helper.dart';

class UserModel {
  int? id;
  String email;
  String pass;

  // Constructor vacío
  UserModel.empty()
      : id = null,
        email = '',
        pass = '';

  UserModel({this.id, required this.email, required this.pass});

  // Convertir un Map en un objeto UserModel
  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        email: json['email'],
        pass: json['pass'],
      );

  // Convertir un objeto UserModel en un Map
  Map<String, dynamic> toMap() => {
        'id': id,
        'email': email,
        'pass': pass,
      };

  // CRUD Functions

  // Insertar un nuevo usuario
  Future<int> createUser() async {
    final db = await DbHelper().database;
    return await db.insert('users', toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Leer todos los usuarios
  static Future<List<UserModel>> readUsers() async {
    final db = await DbHelper().database;
    final List<Map<String, dynamic>> maps = await db.query('users');
    return maps.map((user) => UserModel.fromMap(user)).toList();
  }

  // Leer un usuario por ID
  static Future<UserModel?> readUser(int id) async {
    final db = await DbHelper().database;
    final maps = await db.query(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return UserModel.fromMap(maps.first);
    } else {
      return null;
    }
  }

  // Actualizar un usuario
  Future<int> updateUser() async {
    final db = await DbHelper().database;
    return await db.update(
      'users',
      toMap(),
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Eliminar un usuario
  static Future<int> deleteUser(int id) async {
    final db = await DbHelper().database;
    return await db.delete(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

// Obtener Usuario x Atributos
static Future<int> verifUser(String email, String pass) async {
  List<UserModel> users = await UserModel.readUsers();

  // Buscar el usuario con el email y password proporcionados
  for (var user in users) {
    if (user.email == email && user.pass == pass) {
      return user.id ?? -1; // Retorna el id del usuario si coincide
    }
  }
  return -1; // Retorna -1 si no se encuentra ningún usuario que coincida
}

}
