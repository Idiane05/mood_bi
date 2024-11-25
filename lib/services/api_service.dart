import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<String> fetchVerse(String mood) async {
    // Defining usuable verse for the app.
    Map<String, String> verses = {
      'happy': 'John%203:16',
      'confused': 'Proverbs%203:5-6',
      'sad': 'Psalm%2023:4',
    };

    // Fetch verse reference from API.
    final verseRef = verses[mood] ?? 'John%203:16';
    final url = Uri.parse('https://bible-api.com/$verseRef');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['text'];
      } else {
        return 'Sorry, we could not fetch the verse.';
      }
    } catch (e) {
      return 'Error fetching data: $e';
    }
  }
}