import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:movie_app/core/constants.dart';
import 'package:movie_app/models/ReleaseModel.dart';
import 'package:movie_app/core/network/api_network.dart';
import 'package:movie_app/features/movieDetails/viewModel/details_view_model.dart';

class MovieDetails extends StatefulWidget {
  final ReleaseFilms releaseFilm;
  const MovieDetails({Key? key, required this.releaseFilm}) : super(key: key);

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  var viewModel = DetailsViewModel();
  @override
  void initState() {
    final id = widget.releaseFilm?.id;
    if (id != null) {
      viewModel.fetchDetails(id);
      super.initState();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<DetailsViewModel>(builder: (context, viewModel, child) {
        return 
          Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                image: NetworkImage(
                    "https://image.tmdb.org/t/p/original/${
                    viewModel.detailsModel.posterPath??""}"
                ),
                colorFilter: const ColorFilter.mode(
                  Colors.black54,
                  BlendMode.dstATop,),
                fit: BoxFit.cover,
              )
          ),
        );
      }),
    );
  }
}
