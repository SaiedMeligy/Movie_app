import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/core/config/routes/page_route_name.dart';
import 'package:movie_app/core/network/api_network.dart';
import 'package:movie_app/main.dart';
import 'package:movie_app/models/ReleaseModel.dart';
import 'package:provider/provider.dart';

import '../../../core/constants.dart';
import '../viewModel/releases_view_model.dart';

class NewReleases extends StatefulWidget {
   ReleaseFilms? result;
  NewReleases({super.key,  this.result});

  @override
  State<NewReleases> createState() => _NewReleasesState();
}

class _NewReleasesState extends State<NewReleases> {
  var viewModel=ReleasesViewModel();
  @override
  void initState() {
    super.initState();
    viewModel.fetchReleases();
  }
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    ApiManager.fetchReleases();
    return
      ChangeNotifierProvider(
        create: (context) => viewModel,

        child: Consumer<ReleasesViewModel>(
          builder: (context, viewModel, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xff282A28)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "New Releases",style: Constants.theme.textTheme.titleLarge,),
                         Expanded(
                           child: ListView.builder(
                            itemCount: viewModel.releases.length,
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Stack(
                                    alignment: Alignment.topLeft,
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          print(viewModel.releases[index].id);
                                          navigatekey.currentState!.pushReplacementNamed(PageRouteName.details);
                                },
                                        child: Container(
                                          width: 100,
                                          height: Constants.mediaQuery.height * 0.2,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    "https://image.tmdb.org/t/p/original/${viewModel.releases[index]
                                                        .posterPath}"),
                                                fit: BoxFit.cover,
                                              )
                                          ),
                                        ),
                                      ),
                                      Image.asset("assets/images/bookmark.png")
                                    ],
                                  ),
                                );
                            },),
                         ),
                                  ]
                      ),
                    ),
                  ),
                ),

              ],
            );
          }
        ),
      );
  }
}
