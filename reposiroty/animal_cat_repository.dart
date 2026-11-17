import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_project_4/data/models/cat_model.dart';

class AnimalCatRepository {
  final Dio _dioCat = Dio();

  Future<List<CatModel>> getCatImage () async {
    final Response responseCat = await _dioCat.get(
      'https://api.thecatapi.com/v1/images/search?limit=10',
    );
    List<dynamic> listJson = responseCat.data;
    List<CatModel> listCat = [];
    listJson.forEach((json){
      listCat.add(CatModel.fromJson(json));
    });
    return listCat;
  }
}