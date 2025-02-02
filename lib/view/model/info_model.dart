class InfoModel {
  String date;
  String name;

  String time;

  String mobile;
  bool accept;

  InfoModel({
    required this.accept,
    required this.name,
    required this.date,
    required this.mobile,
    required this.time,
  });

  @override
  String toString() {
    return "Date :$date Time :$time MobileNumber :$mobile Accept :$accept";
  }

  Map<String, dynamic> asMap() {
    return {
      "Picke Date": date,
      "Picke Time": time,
      "Enter Mobile Number": mobile,
      "Enter Name": name,
      "Accepte": accept
    };
  }
}
