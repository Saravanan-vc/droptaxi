class FromModel {
  final String location;
  final double lat;
  final double long;

  const FromModel(
      {required this.lat, required this.location, required this.long});

  factory FromModel.from(Map<String, dynamic> json) {
    return FromModel(
        lat: json['Latitude'],
        location: json['Location_Name'] ?? 'DNC',
        long: json['Longitude']);
  }
}
