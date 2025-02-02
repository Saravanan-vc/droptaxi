class InfoServices {
  final String addressInfo;
  final String emailInfo;
  final int mobileNumber;
  final int whatsAppNumber;

  const InfoServices({
    required this.addressInfo,
    required this.emailInfo,
    required this.mobileNumber,
    required this.whatsAppNumber,
  });

  factory InfoServices.fromJson(Map<String, dynamic> json) {
    return InfoServices(
      addressInfo: json['Address'],
      emailInfo: json['Email'],
      mobileNumber: json['Number'],
      whatsAppNumber: json['Whatsnumber'],
    );
  }
}
