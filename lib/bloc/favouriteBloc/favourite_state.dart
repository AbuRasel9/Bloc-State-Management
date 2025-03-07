import 'package:bloc_state_management/model/favourite_item_model.dart';
import 'package:equatable/equatable.dart';

enum ListStatus { loading, success, error }

class FavouriteState extends Equatable {
  final List<FavouriteItemModel> favouriteList;
  final List<FavouriteItemModel> tempList;
  final ListStatus status;

  const FavouriteState(
      {this.tempList = const [],
      this.favouriteList = const [],
      this.status = ListStatus.loading});

  FavouriteState copyWith(
      {List<FavouriteItemModel>? favouriteData,
      ListStatus? status,
      List<FavouriteItemModel>? tempList}) {
    return FavouriteState(
      favouriteList: favouriteData ?? this.favouriteList,
      status: status ?? this.status,
      tempList: tempList ?? this.tempList,
    );
  }

  @override
  List<Object?> get props => [favouriteList, status, tempList];
}
