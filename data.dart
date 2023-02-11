class cData {
  String cid;
  String cgenre;
  String cname;
  String cphone;

  cData({
    required this.cid,
    required this.cgenre,
    required this.cname,
    required this.cphone,
  });

  factory cData.fromjson(Map<String, dynamic> json) {
    return cData(
        cid: json['id'],
        cgenre: json['genre'],
        cname: json['name'],
        cphone: json['phone']);
  }
}
