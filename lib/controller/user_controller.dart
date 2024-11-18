import 'package:flutter/material.dart';
import 'package:flutter_web_service/model/user_model.dart';
import 'package:flutter_web_service/screens/login_screen.dart';

class UserController {
  final LoginScreen _view;

  UserController(this._view);
  // Crear un nuevo usuario
  Future<int> createUser(String email, String pass) async {
    UserModel user = UserModel(email: email, pass: pass);
    return await user.createUser();
  }

  // Leer todos los usuarios
  Future<List<UserModel>> getAllUsers() async {
    return await UserModel.readUsers();
  }

  // Leer un usuario por ID
  Future<UserModel?> getUserById(int id) async {
    return await UserModel.readUser(id);
  }

  // Actualizar un usuario existente
  Future<int> updateUser(UserModel user) async {
    return await user.updateUser();
  }

  // Eliminar un usuario por ID
  Future<int> deleteUser(int id) async {
    return await UserModel.deleteUser(id);
  }

  void verifUser(String email, String pass) async {
    int id = await UserModel.verifUser(email, pass);
    _view.dashboard(id);
  }
}
