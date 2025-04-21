import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:tvpro/controller/channel_controller.dart';
import 'package:tvpro/view/player_view.dart' show PlayerPopup;
import 'package:stream_channel/stream_channel.dart';

class ChannelListView extends StatefulWidget {
  final ChannelController controller;

  const ChannelListView({super.key, required this.controller});

  @override
  State<ChannelListView> createState() => _ChannelListViewState();
}

class _ChannelListViewState extends State<ChannelListView> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    widget.controller.fetchChannels().then((_) {
      setState(() => isLoading = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final channels = widget.controller.channels;

    return Scaffold(
      appBar: AppBar(title: const Text('IPTV Channels')),
      body:
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                itemCount: channels.length,
                itemBuilder: (context, index) {
                  final channel = channels[index];
                  return ListTile(
                    leading: CachedNetworkImage(
                      imageUrl: channel.logo,
                      width: 50,
                    ),
                    title: Text(channel.name),
                    subtitle: Text(
                      '${channel.city ?? ''}, ${channel.country ?? ''}',
                    ),
                  );
                },
              ),
    );
  }
}
