import 'dart:convert';
import 'dart:core';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Loginresponse {
  final String? id;
  final String email;
  final String token;

  Loginresponse({required this.email, required this.id, required this.token});

  factory Loginresponse.fromJson(Map<String, dynamic> json){//Backend → Frontend  = fromJson()
    return Loginresponse(email: json["User"]["email"], id: json["_id"], token: json["token"]);
  }
}