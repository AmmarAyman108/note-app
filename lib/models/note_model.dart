import 'package:hive/hive.dart';
part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String content;
  @HiveField(3)
  String date;
  @HiveField(4)
  int color;

  NoteModel({
    required this.color,
    required this.date,
    required this.content,
    required this.title,
  });

  factory NoteModel.fromJson(jsonDate) {
    return NoteModel(
      color: jsonDate['color'],
      date: jsonDate['date'],
      content: jsonDate['subTitle'],
      title: jsonDate['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
      'date': date,
      'color': color,
    };
  }
}
