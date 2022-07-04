class DataModel {
  final int id;
  final int userId;
  final String title;
  final String body;

  DataModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  factory DataModel.fromJson(Map<String, dynamic> json){
    return DataModel(id: json['id'],
        userId: json["userId"],
        title: json["title"],
        body: json["title"],);
  }
}
