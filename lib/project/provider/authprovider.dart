import 'package:fitnesstrackerfe/project/models/loginrequest.dart';
import 'package:fitnesstrackerfe/project/models/registerrequest.dart';
import 'package:fitnesstrackerfe/project/service/authservice.dart';
import 'package:flutter/material.dart';

class Authprovider extends ChangeNotifier {
  final Authservice _authservice = Authservice();

  bool isloading = false;
  String? email;
  String? token;
  String? id;
  String? errorMessage;
  Future<void> login(String email, String password) async {
    isloading = true;
    errorMessage = null;
    notifyListeners();
    try {
      final response = await _authservice.login(
        Loginrequest(email: email, password: password),
      );
      token = response.token;
      email = response.email;
    } catch (error) {
      errorMessage = error.toString();
    } finally {
      isloading = false;
      notifyListeners();
    }
  }

  Future<void> register(String email, String password) async {
    try {
      final response = await _authservice.register(
        RegisterRequest(email: email, password: password),
      );
      id = response.id;
      email = response.email;
    } catch (err) {
      errorMessage = err.toString();
    } finally {
      isloading = false;
      notifyListeners();
    }
  }
}
