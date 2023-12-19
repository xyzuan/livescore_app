import 'package:flutter_test/flutter_test.dart';
import 'package:livescore/api/api_service.dart';
import 'package:livescore/models/article_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'api_service_test.mocks.dart';

@GenerateMocks([http.Client, ApiService])
void main() {
  const _baseUrl = 'https://livescore.xyzuan.my.id/api/article/';

  late ApiService apiService;
  late MockClient mockClient;
  setUp(() {
    mockClient = MockClient();
    apiService = ApiService();
  });
  group('ApiService', () {
    test('fetchArticles returns a list of articles if response is successful',
        () async {
      when(mockClient.get(Uri.parse('${_baseUrl}')))
          .thenAnswer((_) async => http.Response('{"articles": []}', 200));
      final articles = await apiService.fetchArticles();
      expect(articles, isA<List<Article>>());
    });
    test('fetchArticles returns an empty list if response fails', () async {
      when(mockClient.get(Uri.parse('${_baseUrl}')))
          .thenAnswer((_) async => http.Response('Server error', 500));
      final articles = await apiService.fetchArticles();
      expect(articles, isA<List<Article>>());
    });
    test('fetchArticles returns an empty list if an error occurs', () async {
      when(mockClient.get(Uri.parse('${_baseUrl}')))
          .thenThrow(Exception('Test error'));

      final articles = await apiService.fetchArticles();
      expect(articles, isA<List<Article>>());
    });
  });
}
