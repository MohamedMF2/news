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
}
