import 'package:bloc/bloc.dart';
import 'package:bloc_state_management/bloc/favouriteBloc/favourite_event.dart';
import 'package:bloc_state_management/bloc/favouriteBloc/favourite_state.dart';
import 'package:bloc_state_management/model/favourite_item_model.dart';
import 'package:bloc_state_management/repository/favourite_repository.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  FavouriteRepository favouriteRepository;
  List<FavouriteItemModel> favouriteData = [];
  List<FavouriteItemModel> tempData = [];

  FavouriteBloc(this.favouriteRepository) : super(const FavouriteState()) {
    on<FetchFavouriteListEvent>(fetchData);
    on<FavouriteItemEvent>(_favouriteItem);
    on<SelectFavouriteItemEvent>(_selectFavouriteItem);
    on<DeleteFavouriteItemEvent>(_deleteFavouriteItem);
  }

  Future<void> fetchData(
      FetchFavouriteListEvent event, Emitter<FavouriteState> emit) async {
    favouriteData = await favouriteRepository.fetchData();
    emit(
      state.copyWith(
        favouriteData: List.from(favouriteData),
        status: ListStatus.success,
      ),
    );
  }
//favourite and unfavourite button click
  void _favouriteItem(FavouriteItemEvent event, Emitter<FavouriteState> emit) {
    final index = favouriteData.indexWhere(
      (element) => element.id == event.item.id,
    );
    favouriteData[index] = event.item;
    emit(
      state.copyWith(
        favouriteData: List.from(
          favouriteData,
        ),
      ),
    );
  }
//select and unselect in check boc
  void _selectFavouriteItem(
      SelectFavouriteItemEvent event, Emitter<FavouriteState> emit) {
    final index = favouriteData.indexWhere(
      (element) => element.id == event.item.id,
    );
    // favouriteData.removeAt(index);
    favouriteData[index] = event.item;
    tempData.add(event.item);

    emit(
      state.copyWith(
        favouriteData: List.from(
          favouriteData,
        ),
      ),
    );
  }
  //delete item form list

  void _deleteFavouriteItem(
      DeleteFavouriteItemEvent event, Emitter<FavouriteState> emit) {

    favouriteData.removeWhere(
      (element) => tempData.contains(element),
    );

    emit(
      state.copyWith(
        favouriteData: List.from(
          favouriteData,
        ),
      ),
    );
  }
}
