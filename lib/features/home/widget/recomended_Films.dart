
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../../core/constants.dart';
import '../viewModel/recomended_view_model.dart';

class RecomendedFilms extends StatefulWidget {
  const RecomendedFilms({super.key});

  @override
  State<RecomendedFilms> createState() => _RecomendedFilmsState();
}

class _RecomendedFilmsState extends State<RecomendedFilms> {
  var viewModel=RecomendedViewModel();
  @override
  void initState() {
    viewModel.fetchTrending();
    super.initState();
  }
  Widget build(BuildContext context) {
    return

      ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<RecomendedViewModel>(
        builder: (context, viewModel, child) {
          return Container(
            decoration: const BoxDecoration(
                color: Color(0xff282A28)
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 15, vertical: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Recommended",
                      style: Constants.theme.textTheme.titleLarge,),
                    Expanded(
                      child: ListView.builder(
                        itemCount: viewModel.trendList.length,
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Stack(
                                      alignment: Alignment.topLeft,
                                      children: [
                                        Container(
                                          width: 100,
                                          height: Constants.mediaQuery.height * 0.2,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(
                                                  5),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    "https://image.tmdb.org/t/p/original/${viewModel
                                                        .trendList[index]
                                                        .posterPath}"),
                                                fit: BoxFit.cover,
                                              )
                                          ),
                                        ),
                                        Image.asset("assets/images/bookmark.png")
                                      ],
                                    ),
                                  ),
                                ),
                                
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(Icons.star,color: Color(0xffFFA90A),size: 20,),
                                        SizedBox(width: 5,),
                                        Text("${viewModel.trendList[index].voteAverage?.toStringAsFixed(1)}",style: Constants.theme.textTheme.bodyMedium,),
                                      ],
                                    ),
                                    Container(
                                      width:100,
                                      child: Text("${viewModel.trendList[index].title}",style: Constants.theme.textTheme.bodyLarge?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Text("${viewModel.trendList[index].releaseDate}",style: Constants.theme.textTheme.bodyMedium?.copyWith(
                                      color: Color(0xffB5B4B4)
                                    ),)

                                  ],
                                ),
                              ],
                            );

                        },),
                    ),

                  ]
              ),
            ),
          );
        }
      ),
    );
  }
}
