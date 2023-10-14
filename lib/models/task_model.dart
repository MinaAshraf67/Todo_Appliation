// ignore_for_file: public_member_api_docs, sort_constructors_first
class TaskModel {
  String id;
  String title;
  String description;
  int date;
  bool isDone;
  TaskModel({
    this.id = "",
    required this.title,
    required this.description,
    required this.date,
    this.isDone = false,
  });
  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
          title: json['title'],
          description: json['description'],
          date: json['date'],
          isDone: json['isDone'],
          id: json["id"],
        );

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "date": date,
      "isDone": isDone,
      "id": id,
    };
  }

  // TaskModel fromJson(Map<String, dynamic> json) {
  //   return TaskModel(
  //     title: json['title'],
  //     description: json['description'],
  //     date: json['date'],
  //     isDone: json['isDone'],
  //     id: json["id"],
  //   );
  // }
}
