import 'dart:convert';
import 'package:fitnesstrackerfe/project/models/loginrequest.dart';
import 'package:fitnesstrackerfe/project/models/loginresponse.dart';
import 'package:fitnesstrackerfe/project/models/registerrequest.dart';
import 'package:fitnesstrackerfe/project/models/registerresponse.dart';
import 'package:http/http.dart' as http;

class Authservice {
  final String baseUrl = "http://localhost:3000";
  Future<Loginresponse> login(Loginrequest request) async {
    final response = await http.post(
      Uri.parse("$baseUrl/login"), //User trying login
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(
        request.toJson(),
      ), //content from body is encoded to json, and
    );

    if (response.statusCode == 200) {
      return Loginresponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Login failed: ${response.body}");
    }
  }

  Future<RegisterResponse> register(RegisterRequest request) async {
    final response = await http.post(
      Uri.parse(
        "$baseUrl/register",
      ), //whatever response comes from post of register
      headers: {"Content-Type": "Appliation/json"}, //it is stored in response
      body: jsonEncode(request.toJson()),
    );
    if (response.statusCode == 200) {
      return RegisterResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Registration failed: ${response.body}");
    }
  }
}
