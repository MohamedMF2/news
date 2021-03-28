import 'dart:convert';

class ItemModel {
  final int id;
  final bool deleted;
  final String type;
  final String by;
  final int time;
  final String text;
  final bool dead;
  final int parent;
  final List<dynamic> kids;
  final String url;
  final int score;
  final String title;
  final int descendants;

  ItemModel.fromJson(Map<String, dynamic> pasrsedJson)
      : id = pasrsedJson['id'],
        deleted = pasrsedJson['deleted'],
        type = pasrsedJson['type'],
        by = pasrsedJson['by'],
        time = pasrsedJson['time'],
        text = pasrsedJson['text'],
        dead = pasrsedJson['dead'],
        parent = pasrsedJson['parent'],
        kids = pasrsedJson['kids'],
        url = pasrsedJson['url'],
        score = pasrsedJson['score'],
        title = pasrsedJson['title'],
        descendants = pasrsedJson['descendants'];

  ItemModel.fromDb(Map<String, dynamic> pasrsedJson)
      : id = pasrsedJson['id'],
        deleted = pasrsedJson['deleted'] == 1,
        type = pasrsedJson['type'],
        by = pasrsedJson['by'],
        time = pasrsedJson['time'],
        text = pasrsedJson['text'],
        dead = pasrsedJson['dead'] == 1,
        parent = pasrsedJson['parent'],
        kids = json.decode(pasrsedJson['kids']),
        url = pasrsedJson['url'],
        score = pasrsedJson['score'],
        title = pasrsedJson['title'],
        descendants = pasrsedJson['descendants'];

  Map<String, dynamic> toMapForDb() {
    return <String, dynamic>{
      "id": id,
      "deleted": deleted ? 1 : 0,
      "type": type,
      "by": by,
      "time": time,
      "text": text,
      "dead": dead ? 1 : 0,
      "parent": parent,
      "url": url,
      "score": score,
      "title": title,
      "descendants": descendants,
      "kid": jsonEncode(kids)
    };
  }
}
