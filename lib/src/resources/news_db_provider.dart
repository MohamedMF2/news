import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';
import '../models/itemmodel.dart';
import './repository.dart';

class NewsDbProvider implements Source, Cache {
  Database db;

  NewsDbProvider() {
    init();
  }

  void init() async {
    //ref to a directory on the phone
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    // ref to the database itself
    final path = join(documentsDirectory.path, "items.db");

    db = await openDatabase(path, version: 1,
        onCreate: (Database newDb, int version) {
      newDb.execute("""
          CREATE TABLE items(
             id INTEGER PRIMARY KEY,
             type TEXT,
             by TEXT,
             time INTEGER,
             text TEXT,
             parents INTEGER,
             kids BLOB,
             dead INTEGER,
             deleted INTEGER,
             url TEXT,
             score INTEGER,
             title TEXT,
             descendants INTEGER  
          )
        """);
    });
  }

  Future<List<int>> fetchTopIds() {
    return null;
  }

  Future<ItemModel> fetchItem(int id) async {
    final maps = await db
        .query("items", columns: null, where: "id = ?", whereArgs: [id]);

    if (maps.length > 0) {
      return ItemModel.fromDb(maps.first);
    }
    return null;
  }

  Future<int> addItem(ItemModel item) {
    return db.insert("items", item.toMapForDb());
  }
}

final newsDbProvider = NewsDbProvider();
