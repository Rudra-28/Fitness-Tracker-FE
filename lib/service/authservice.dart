import 'dart:convert';
import 'package:fitnesstrackerfe/loginpage.dart';
import 'package:fitnesstrackerfe/models/loginrequest.dart';
import 'package:fitnesstrackerfe/models/loginresponse.dart';
import 'package:http/http.dart' as http;

class Authservice {
   final String baseUrl = "http://localhost:3000";
   Future<Loginresponse> login(Loginrequest request) async {
    final response = await http.post(
      Uri.parse("$baseUrl/login"),//User trying login
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(request.toJson()), //content from body is encoded to json, and 
    );

    if (response.statusCode == 200) {
      return Loginresponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Login failed: ${response.body}");
    }
  }
}