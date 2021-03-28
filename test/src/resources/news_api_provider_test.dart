import 'package:news/src/resources/news_Api_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main() {
  test('FetchTopIds returns a list of ids', () async {
    final newsApi = NewsApiProvider();

    newsApi.client = MockClient((requst) async {
      return Response(json.encode([1, 2, 3, 4, 5, 6]), 200);
    });

    final ids = await newsApi.fetchTopIds();
    expect(ids, [1, 2, 3, 4, 5, 6]);
  });

  test('FetchItem returns ItemModel', () async {
    final newsApi = NewsApiProvider();

    newsApi.client = MockClient((request) async {
      final jsonMap = {'id': 155};
      return Response(json.encode(jsonMap), 200);
    });
    final item = await newsApi.fetchItem(999);

    expect(item.id, 155);
  });
}
