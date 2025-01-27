class InfoModel {
  String date;
  String name;
  String email;
  String time;
  String adults;
  String chils;
  String laguggage;
  String mrorms;
  String mobile;
  String altermobile;
  String fromadress;
  String toadress;
  String remark;
  String getinfo;
  bool accept;

  InfoModel(
      {required this.accept,
      required this.name,
      required this.email,
      required this.adults,
      required this.altermobile,
      required this.chils,
      required this.date,
      required this.fromadress,
      required this.getinfo,
      required this.laguggage,
      required this.mobile,
      required this.mrorms,
      required this.remark,
      required this.time,
      required this.toadress});

  @override
  String toString() {
    return "Date :$date Time :$time Adults :$adults Childs :$chils Lauggage :$laguggage MobileNumber :$mobile AlterNative :$altermobile Mr or Ms : $mrorms Name :$name email :$email pick-up :$fromadress Drop address :$toadress remark :$remark getinfo :$getinfo Accept :$accept";
  }

  Map<String, dynamic> asMap() {
    return {
      "Picke Date": date,
      "Picke Time": time,
      "Please Select No.Of Adults": adults,
      "Please Select No.Of Childs": chils,
      "Please Select No.Of Laguggage": laguggage,
      "Enter Mobile Number": mobile,
      "Enter AlterNative Mobile Number": altermobile,
      "MOS": mrorms,
      "Enter Name": name,
      "Enter Email": email,
      "Enter picke-up Address": fromadress,
      "Enter Drop Address": toadress,
      "Enter Remark": remark,
      "Please Selecte how you know about us": getinfo,
      "Accepte": accept
    };
  }
}
