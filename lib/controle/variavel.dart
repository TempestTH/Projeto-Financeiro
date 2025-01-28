import 'package:flutter/material.dart';

class AppState with ChangeNotifier {
  String _email = "";
  String get email => _email;

  void updateEmail(String newEmail) {
    _email = newEmail;
    notifyListeners();  // Notifica todos os ouvintes
  }

  String _senha = "";
  String get senha => _senha;
  
    void updateSenha(String newSenha) {
    _senha = newSenha;
    notifyListeners();  // Notifica todos os ouvintes
  }
}
