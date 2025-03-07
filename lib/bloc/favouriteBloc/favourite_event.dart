import 'package:bloc_state_management/model/favourite_item_model.dart';
import 'package:equatable/equatable.dart';

abstract class FavouriteEvent extends Equatable{
  const FavouriteEvent();

  @override
  List<Object?> get props => [];
}

class FetchFavouriteListEvent extends FavouriteEvent{

}
class FavouriteItemEvent extends FavouriteEvent{
  final FavouriteItemModel item;
  const FavouriteItemEvent({required this.item});

}
class SelectFavouriteItemEvent extends FavouriteEvent{
  final FavouriteItemModel item;
  const SelectFavouriteItemEvent({required this.item});

}
class DeleteFavouriteItemEvent extends FavouriteEvent{

}
