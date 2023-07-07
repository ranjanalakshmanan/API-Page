import 'dart:core';

class Api{
  late int id;
  late String title;
  late String url;
  late String urlToImage;
  late String  description;
  late int speciality;
  late String  newsUniqueId;
  late int  trendingLatest;
  late int publishedAt;


  Api({
    required this.id,
    required this.title,
    required this.url,
    required this.urlToImage,
    required this.description,
    required this.speciality,
    required this.newsUniqueId,
    required this.trendingLatest,
    required this.publishedAt,
  });

  factory Api.fromJson(Map<String, dynamic> json) {

    return Api(
        id : json['id'],
        title: json['title'].toString(),
        url: json['url'].toString(),
        urlToImage: json['urlToImage'].toString(),
        description: json['description'].toString(),
        speciality: json['speciality'],
      newsUniqueId: json['newsUniqueId'].toString(),
      trendingLatest: json['trendingLatest'],
      publishedAt: json['publishedAt'],
    );
  }
}
class NewsAPI {
  int? success;
  String? message;
  Data? data;
  String? timestamp;

  NewsAPI({this.success, this.message, this.data, this.timestamp});

  NewsAPI.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;

    data['timestamp'] = this.timestamp;
    return data;
  }
}

class Data {
  List<News>? news;


  Data(
      {this.news}
       );

  Data.fromJson(Map<String, dynamic> json) {
    if (json['news'] != null) {
      news = <News>[];
      json['news'].forEach((v) {
        news!.add(new News.fromJson(v));
      });
    }

  }


}

class News {
  int? id;
  String? title;
  String? url;
  String? urlToImage;
  String? description;
  String? speciality;
  String? newsUniqueId;
  int? trendingLatest;
  String? publishedAt;

  News(
      {this.id,
        this.title,
        this.url,
        this.urlToImage,
        this.description,
        this.speciality,
        this.newsUniqueId,
        this.trendingLatest,
        this.publishedAt});

  News.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    description = json['description'];
    speciality = json['speciality'];
    newsUniqueId = json['newsUniqueId'];
    trendingLatest = json['trendingLatest'];
    publishedAt = json['publishedAt'];
  }


}

