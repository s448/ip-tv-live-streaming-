import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:tvpro/controller/streams_controller.dart';
import 'package:tvpro/models/streams.dart';
import 'package:tvpro/view/player_view.dart';

class StreamListView extends StatefulWidget {
  const StreamListView({super.key});

  @override
  State<StreamListView> createState() => _StreamListViewState();
}

class _StreamListViewState extends State<StreamListView> {
  late Future<List<StreamModel>> futureStreams;

  @override
  void initState() {
    super.initState();
    futureStreams = StreamController().fetchStreams();
  }

  void openPlayer(StreamModel stream) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => PlayerPopup(stream: stream)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Live Streams")),
      body: FutureBuilder<List<StreamModel>>(
        future: futureStreams,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            log(snapshot.error.toString(), name: "StreamListView");
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          final streams = snapshot.data!;
          return ListView.builder(
            itemCount: streams.length,
            itemBuilder: (context, index) {
              final stream = streams[index];
              return ListTile(
                leading: CachedNetworkImage(
                  imageUrl: stream.logo ?? "",
                  width: 50,
                  errorWidget: (_, __, ___) => const Icon(Icons.tv),
                ),
                title: Text(stream.name ?? ""),
                subtitle: Text("Feed: ${stream.feed} • ${stream.quality}"),
                onTap: () => openPlayer(stream),
              );
            },
          );
        },
      ),
    );
  }
}
