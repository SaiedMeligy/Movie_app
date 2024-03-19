import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_app/models/ReleaseModel.dart';
import 'package:movie_app/features/splash/splash_view.dart';
import 'package:movie_app/features/home/page/home_view.dart';
import 'package:movie_app/features/home/widget/new_releases.dart';
import 'package:movie_app/core/config/routes/page_route_name.dart';
import 'package:movie_app/features/movieDetails/details_view.dart';

class Routes{
static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteName.initial:
        return MaterialPageRoute(builder: (context) => SplashView(),settings: settings);
      case PageRouteName.home:
        return MaterialPageRoute(builder: (context) => HomeView(),settings: settings);
      case PageRouteName.release:
        return MaterialPageRoute(builder: (context) => NewReleases(),settings: settings);
      case PageRouteName.details:
        return MaterialPageRoute(builder: (context) => MovieDetails(releaseFilm: settings.arguments as ReleaseFilms,),settings: settings);
      default:
        return MaterialPageRoute(builder: (context) => HomeView());
    }
  }
}