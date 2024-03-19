import 'package:flutter/cupertino.dart';
import 'package:movie_app/core/network/api_network.dart';
import 'package:movie_app/models/ReleaseModel.dart';

import '../../../models/DetailsModel.dart';

class DetailsViewModel extends ChangeNotifier{
    DetailsModel _detailsModel= DetailsModel() ;
  DetailsModel get detailsModel => _detailsModel;
  Future<void>fetchDetails(int id)async{
try{
    _detailsModel = await ApiManager.fetchDetailsMovie(id);
    print(_detailsModel);
    //notifyListeners();

  }
  catch(e){
    print(e);
  }
  }
}