import 'dart:async';

import 'news_api_provider.dart';
import './news_db_provider.dart';
import '../models/itemmodel.dart';

class Repository {
  List<Source> sources = <Source>[
    newsDbProvider,
    NewsApiProvider(),
  ];

  List<Cache> caches = <Cache>[
    newsDbProvider,
  ];

// until NewsDbProvider.fetchTopIds get implemented
  Future<List<int>> fetchTopIds() {
    return sources[1].fetchTopIds();
  } //fetchTopIds

  Future<ItemModel> fetchItem(int id) async {
    ItemModel item;
    for (var source in sources) {
      item = await source.fetchItem(id);
      if (item != null) {
        break;
      }
    }

    for (var cache in caches) {
      cache.addItem(item);
    }
    return item;
  } //fetchItem

} //Repository

abstract class Source {
  Future<List<int>> fetchTopIds();
  Future<ItemModel> fetchItem(int id);
}

abstract class Cache {
  Future<int> addItem(ItemModel item);
}
