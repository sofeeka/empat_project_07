import 'dart:convert';
import 'package:http/http.dart' as http;

import 'bored_activity.dart';

class ApiService {
  final String baseUrl = 'https://www.boredapi.com/api/activity';

  Future<BoredActivity> fetchData() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      return BoredActivity.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}
