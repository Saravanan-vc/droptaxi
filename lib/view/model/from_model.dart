class FromModel {
  final String location;
  final double lat;
  final double long;
  final String adress;

  const FromModel(
      {required this.adress,
      required this.lat,
      required this.location,
      required this.long});

  factory FromModel.from(Map<String, dynamic> json) {
    return FromModel(
        adress: json['Adress'] ?? 'DNC',
        lat: json['latTitued'],
        location: json['locationName'] ?? 'DNC',
        long: json['longTitued']);
  }
}
