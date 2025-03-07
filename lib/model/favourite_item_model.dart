import 'package:equatable/equatable.dart';

class FavouriteItemModel extends Equatable {
  const FavouriteItemModel({
    required this.id,
    required this.title,
    this.isDeleting = false,
    this.isFavourite = false,
  });

  final int id;
  final String title;
  final bool? isDeleting;
  final bool? isFavourite;

  FavouriteItemModel copyWith({
    int? id,
    String? value,
    bool? isDeleting,
    bool? isFavourite,
  }) {
    return FavouriteItemModel(
        id: id ?? this.id,
        title: value ?? this.title,
        isDeleting: isDeleting,
        isFavourite: isFavourite);
  }

  @override
  List<Object?> get props => [id,title,isDeleting,isFavourite];
}
