import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/core/constants.dart';
import 'package:movie_app/models/PosterModel.dart';
import 'package:movie_app/models/RecomendedModel.dart';
import 'package:movie_app/models/ReleaseModel.dart';

import '../../models/DetailsModel.dart';

class ApiManager{
  static Future<List<Results>> fetchPosters()async{
    Uri url=Uri.parse("https://api.themoviedb.org/3/movie/popular?api_key=${Constants.api_key}");
    final response=await http.get(url);
    if(response.statusCode==200){
      //print(response.body);
      var data = jsonDecode(response.body);
      List posterList =data["results"];
      PosterModel posterModel = PosterModel.fromJson(data);
      return posterModel.results??[];
    }else
      {
        throw Exception("Failed to load posters");
      }
  }
  static Future<List<ReleaseFilms>> fetchReleases()async{
    Uri url=Uri.parse("https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.api_key}");
    final response=await http.get(url);
    if(response.statusCode==200){
      var data = jsonDecode(response.body);
      List releaseList =data["results"];
      ReleaseModel releaseModel = ReleaseModel.fromJson(data);
      return releaseModel.results??[];
    }else
      {
        throw Exception("Failed to load posters");
      }
  }
  static Future<List<RecommendFilms>> fetchTrending()async{
    Uri url=Uri.parse("https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.api_key}");
    final response = await http.get(url);
    if(response.statusCode==200){
      var data=jsonDecode(response.body);
      List recomendedList = data["results"];
      RecomendedModel recomendedModel = RecomendedModel.fromJson(data);
      return recomendedModel.results??[];
    }
    else {
      throw Exception("Failed to load trending");
    }
  }
  static Future<DetailsModel> fetchDetailsMovie(int id)async{
    Uri url=Uri.parse("https://api.themoviedb.org/3/movie/$id?api_key=${Constants.api_key}");
    final response = await http.get(url);
    if(response.statusCode==200){
      final data=jsonDecode(response.body);
      print(response.body);

      return DetailsModel.fromJson(data);
    }
    else {
      throw Exception("Failed to load trending");
    }
  }
}