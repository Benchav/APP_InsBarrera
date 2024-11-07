import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthService extends ChangeNotifier {
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseToken = 'AIzaSyBfsQ8TUbhgUgrj-Y8dUiifuRHH_cDZlR4';

  final storage = FlutterSecureStorage();

  // Método para mapear errores de Firebase a mensajes en español
  String _parseFirebaseError(String errorCode) {
    switch (errorCode) {
      case "EMAIL_NOT_FOUND":
        return "El correo no está registrado.";
      case "INVALID_PASSWORD":
        return "Contraseña incorrecta.";
      case "USER_DISABLED":
        return "Esta cuenta ha sido deshabilitada.";
      default:
        return "Ocurrió un error inesperado. Inténtalo de nuevo.";
    }
  }

  Future<String?> createUser(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final url =
        Uri.https(_baseUrl, '/v1/accounts:signUp', {'key': _firebaseToken});

    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);

    if (decodedResp.containsKey('idToken')) {
      await storage.write(key: 'token', value: decodedResp['idToken']);
      return null;
    } else {
      return _parseFirebaseError(decodedResp['error']['message']);
    }
  }

  Future<String?> login(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final url = Uri.https(
        _baseUrl, '/v1/accounts:signInWithPassword', {'key': _firebaseToken});

    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);

    if (decodedResp.containsKey('idToken')) {
      await storage.write(key: 'token', value: decodedResp['idToken']);
      return null;
    } else {
      return _parseFirebaseError(decodedResp['error']['message']);
    }
  }

  Future<void> logout() async {
    await storage.delete(key: 'token');
    notifyListeners();
  }

  Future<String> readToken() async {
    return await storage.read(key: 'token') ?? '';
  }

  bool isAuthenticated() {
    // Método para verificar si el usuario está autenticado leyendo el token
    // Devuelve true si hay un token guardado, de lo contrario, false.
    return storage.read(key: 'token') != null;
  }
}

