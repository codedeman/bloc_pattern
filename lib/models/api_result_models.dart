
import 'dart:core';
import 'package:flutter/material.dart';
import 'article.dart';

class ApiResultModel {

  String status;
  int totalResults;
  List<Articles> articles;
  ApiResultModel({this.status, this.totalResults, this.articles});

  ApiResultModel.fromJson(Map<String, dynamic>json) {
      status = json['status'];
      totalResults = json['totalResults'];
      if (json['articles'] != null) {
        articles = new List<Articles>();
        json['articles'].forEach((v) {
          articles.add(new Articles.fromJson(v));
        });
      }

  }

  Map<String, dynamic> toJson() {

    final Map<String,dynamic> data = new Map<String,dynamic>();
    data['status'] = this.status;
    data['totalResults'] = this.totalResults;
    if (this.articles != null) {
      data['articles'] = this.articles.map((v) => v.toJson()).toList();
    }
    return data;

  }

}