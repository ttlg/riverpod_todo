import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesClient = Provider((ref) => SharedPreferencesClient());

class SharedPreferencesClient {
  Future<List<Map<String, dynamic>>> getJsonList(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.clear();
    return List<Map<String, dynamic>>.from(
        jsonDecode(prefs.getString(key) ?? '[]'));
  }

  Future<void> saveJson(String key, List<Map<String, dynamic>> json) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, jsonEncode(json));
  }
}
