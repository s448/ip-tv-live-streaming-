import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tvpro/models/streams.dart';

class StreamController {
  Future<List<StreamModel>> fetchStreams() async {
    final response = await http.get(
      Uri.parse("https://iptv-org.github.io/api/guides.json"),
    );

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((json) => StreamModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load streams');
    }
  }
}
