class Notes {
  late int id;
  late String title;
  late String details;
  late int user_id;

  //Read from DataBase

  Notes.fromMap(Map<String, dynamic> rowMap) {
    id = rowMap['id'];
    title = rowMap['title'];
    details = rowMap['details'];
    user_id = rowMap['user_id'];
  }

//Store on DataBase

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['title'] = title;
    map['details'] = details;
    map['user_id'] = user_id;
    return map;
  }
}
