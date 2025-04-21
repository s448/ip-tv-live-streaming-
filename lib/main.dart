import 'package:flutter/material.dart';
import 'package:tvpro/controller/channel_controller.dart';
import 'package:tvpro/view/channel_list_view.dart';
import 'package:tvpro/view/streams_list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter IPTV App',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home:
          StreamListView(), // Change to ChannelListView() to see the channel list
    );
  }
}
