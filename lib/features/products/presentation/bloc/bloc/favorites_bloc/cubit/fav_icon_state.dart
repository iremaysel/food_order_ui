part of 'fav_icon_cubit.dart';

abstract class FavIconState extends Equatable {
  const FavIconState();

  @override
  List<Object> get props => [];
}

class IsFavoriteIcon extends FavIconState {
  final bool isRed;

  const IsFavoriteIcon(this.isRed);
  @override
  List<Object> get props => [isRed];
}

class IsNotFavorite extends FavIconState {
  final bool isAzul;

  const IsNotFavorite(this.isAzul);
  @override
  List<Object> get props => [isAzul];
}
