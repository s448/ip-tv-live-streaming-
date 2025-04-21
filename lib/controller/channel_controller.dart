import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/channel.dart';

class ChannelController {
  List<Channel> _channels = [];

  List<Channel> get channels => _channels;

  Future<void> fetchChannels() async {
    final response = await http.get(
      Uri.parse('https://iptv-org.github.io/api/streams.json'),
    );

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      _channels = data.map((e) => Channel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load channels');
    }
  }
}
