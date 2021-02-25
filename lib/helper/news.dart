import 'dart:convert';

import 'package:newsapp/models/article_model.dart';
import 'package:http/http.dart' as http;

class News{


  List<ArticleModel> news= [];


  Future<void> getNews(String country) async
  {
    String url='http://newsapi.org/v2/top-headlines?country=$country&category=business&apiKey=59aebe5fd71a41f8b2c79f5acd175f5e';
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if(jsonData['status']== 'ok')
      {
        jsonData['articles'].forEach((element){
          if(element['urlToImage']!=null && element['description']!=null)
            {
              ArticleModel articleModel = ArticleModel(
                title: element['title'],
                author: element['author'],
                content: element['content'],
                description: element['description'],
                url: element['url'],
                urlToImage: element['urlToImage']
              );
              news.add(articleModel);
            }

        });
      }

  }
}

class CategoryNewsClass{
  List<ArticleModel> news= [];


  Future<void> getNews(String category) async
  {
    String url='http://newsapi.org/v2/top-headlines?country=in&category=${category}&apiKey=59aebe5fd71a41f8b2c79f5acd175f5e';
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if(jsonData['status']== 'ok')
    {
      jsonData['articles'].forEach((element){
        if(element['urlToImage']!=null && element['description']!=null)
        {
          ArticleModel article = ArticleModel(
              title: element['title'],
              author: element['author'],
              content: element['content'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage']
          );
          news.add(article);
        }

      });
    }

  }
}



class CategoryNewCountry{
  List<ArticleModel> news= [];


  Future<void> getNews(String country) async
  {
    String url='http://newsapi.org/v2/top-headlines?country=$country&category=business&apiKey=59aebe5fd71a41f8b2c79f5acd175f5e';
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if(jsonData['status']== 'ok')
    {
      jsonData['articles'].forEach((element){
        if(element['urlToImage']!=null && element['description']!=null)
        {
          ArticleModel article = ArticleModel(
              title: element['title'],
              author: element['author'],
              content: element['content'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage']
          );
          news.add(article);
        }

      });
    }

  }
}
