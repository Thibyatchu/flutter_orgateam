import 'package:flutter/material.dart';

class AuthService with ChangeNotifier {
  bool _isAuthenticated = false;
  bool _isAdmin = false;

  bool get isAuthenticated => _isAuthenticated;
  bool get isAdmin => _isAdmin;

  Future<bool> login(String email, String password) async {
    // Simulez une requête d'authentification
    await Future.delayed(const Duration(seconds: 2));
    _isAuthenticated = true;
    notifyListeners();
    return _isAuthenticated;
  }

  Future<bool> register(String email, String password) async {
    // Simulez une requête d'inscription
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }

  Future<bool> loginAdmin(String email, String password) async {
    // Simulez une requête d'authentification admin
    await Future.delayed(const Duration(seconds: 2));
    _isAdmin = true;
    notifyListeners();
    return _isAdmin;
  }

  void logout() {
    _isAuthenticated = false;
    _isAdmin = false;
    notifyListeners();
  }
}