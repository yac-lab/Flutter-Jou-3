import 'package:flutter/material.dart';

class InfoEmail {
  static List<Map<String, String>> users = [];

  static void signup(String email, String password) {
    users.add({
      'email': email,
      'password': password,
    });
    print("Itilizatè a ajoute imèl li an korekteman: $email");
  }

  static bool login(String email, String password) {
    for (var user in users) {
      if (user['email'] == email && user['password'] == password) {
        return true;
      }
    }
    return false;
  }
}