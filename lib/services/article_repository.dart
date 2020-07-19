
import 'package:blogc_pattern/models/api_result_models.dart';
import 'package:blogc_pattern/models/article.dart';
import 'package:blogc_pattern/res/constrant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class ArticlesRespository {
  Future<List<Articles>> getArticles();
}

class ArticleWorker implements ArticlesRespository {

  @override
  Future<List<Articles>> getArticles() async {
    // TODO: implement getArticles
    var response = await http.get(AppConstrant.cricArticleUrl);
    if(response.statusCode == 200) {
      var data = json.decode(response.body);
      List<Articles> articles = ApiResultModel.fromJson(data).articles;
      return articles;
    } else {
      throw Exception();
    }
//    List<Articles> articles = ApiResultModel.fromJson()



  }


}