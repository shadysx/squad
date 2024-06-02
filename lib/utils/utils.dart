import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:squad/models/duo.dart';
import 'package:squad/models/user.dart';

Future<List<User>> loadMockUsers() async {
  final String response = await rootBundle.loadString('lib/mock/users.json');
  final List<dynamic> data = json.decode(response);
  return data.map((json) => User.fromJson(json)).toList();
}

Future<List<Duo>> loadMockDuos() async {
  final String response = await rootBundle.loadString('lib/mock/duos.json');
  final List<dynamic> data = json.decode(response);
  return data.map((json) => Duo.fromJson(json)).toList();
}

Future<User>getMockUserById(int userId) async {
  // Parse the JSON string
  final String response = await rootBundle.loadString('lib/mock/users.json');
  List<dynamic> data = json.decode(response);

  // Find the user with the matching ID
  for (var userJson in data) {
    if (userJson['id'] as int == userId) {
      return User.fromJson(userJson as Map<String, dynamic>);
    }
  }

  // If no user found, throw an exception or return a default user
  throw Exception('User with ID $userId not found');
  // Alternatively, return a default User object if desired
  // return User(id: -1, firstName: '', lastName: '');
}