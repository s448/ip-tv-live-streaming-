class StreamModel {
  final String? channel;
  final String? feed;
  final String? url;
  final String? referrer;
  final String? userAgent;
  final String? quality;
  final String? logo;
  final String? name;

  StreamModel({
    required this.channel,
    required this.feed,
    required this.url,
    required this.referrer,
    required this.userAgent,
    required this.quality,
    required this.logo,
    required this.name,
  });

  factory StreamModel.fromJson(Map<String, dynamic> json) {
    return StreamModel(
      channel: json['channel'] ?? "channel",
      feed: json['feed'] ?? "feed",
      url: json['url'] ??= "url",
      referrer: json['referrer'] ??= "referrer",
      userAgent: json['user_agent'] ??= "user_agent",
      quality: json['quality'] ??= "quality",
      logo: json['logo'] ?? 'logo', // safe fallback
      name: json['name'] ?? "Unknown Stream",
    );
  }
}
