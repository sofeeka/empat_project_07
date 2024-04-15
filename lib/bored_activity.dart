class BoredActivity {
  final String activity;
  final String type;
  final int participants;
  final double price;
  final String link;
  final String key;
  final double accessibility;

  BoredActivity({
    required this.activity,
    required this.type,
    required this.participants,
    required this.price,
    required this.link,
    required this.key,
    required this.accessibility,
  });

  factory BoredActivity.fromJson(Map<String, dynamic> json) {
    return BoredActivity(
      activity: json['activity'],
      type: json['type'],
      participants: json['participants'],
      price: json['price'].toDouble(),
      link: json['link'],
      key: json['key'],
      accessibility: json['accessibility'].toDouble(),
    );
  }
}
