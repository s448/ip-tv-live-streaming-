class Channel {
  final String id;
  final String name;
  final String? country;
  final String? city;
  final String website;
  final String logo;

  Channel({
    required this.id,
    required this.name,
    required this.country,
    required this.city,
    required this.website,
    required this.logo,
  });

  factory Channel.fromJson(Map<String, dynamic> json) {
    return Channel(
      id: json['id'],
      name: json['name'],
      country: json['country'],
      city: json['city'],
      website: json['website'] ?? '',
      logo: json['logo'] ?? '',
    );
  }
}
