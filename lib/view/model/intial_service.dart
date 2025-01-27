class IntialServiceModel {
  String service;
  int amout;
  String car;
  String from;
  String to;
  //
  String? rounds;
  String? packages;
  IntialServiceModel(
      {required this.amout,
      required this.car,
      required this.from,
      required this.service,
      required this.to,
      this.packages,
      this.rounds});
  factory IntialServiceModel.fromJson(Map<String, dynamic> json) {
    return IntialServiceModel(
        amout: json['dumy'],
        car: json['dumy'],
        from: json['dumy'],
        service: json['dumy'],
        to: json['dumy']);
  }

  @override
  String toString() {
    return "Amount :$amout service :$service car :$car from :$from to :$to round :${rounds!.isEmpty ? "null" : rounds} packages :${packages!.isEmpty ? "null" : packages}";
  }

  Map<String, dynamic> asMap() {
    return {
      "Service":service,
      "Amount":amout,
      "Car":car,
      "From":from,
      "TO":to
    };
  }
}
