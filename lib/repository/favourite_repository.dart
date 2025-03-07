import 'package:bloc_state_management/model/favourite_item_model.dart';

class FavouriteRepository {
  Future<List<FavouriteItemModel>>fetchData()async{
    await Future.delayed(const Duration(seconds: 4));
    return List.of(_generateList(10));
  }
  List<FavouriteItemModel>_generateList(int length){
    return List.generate(length,(index)=> FavouriteItemModel(id: index,title: "value $index"));
  }
}