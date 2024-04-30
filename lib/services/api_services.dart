import 'dart:convert';

import 'package:ecocycle/models/article_model.dart';
import 'package:http/http.dart';

class ApiArticle {
  final endPointUrl =
      "https://newsapi.org/v2/everything?q=limbah&apiKey=794dc1e672bb4852830f26468c6d4da7";

  Future<List<Article>> getArticle() async {
    Response res = await get(Uri.parse(endPointUrl));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Gagal Mendapatkan Articles");
    }
  }
}
