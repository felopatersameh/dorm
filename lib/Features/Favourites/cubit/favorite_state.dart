part of 'favorite_cubit.dart';

 class FavoriteState {
  final bool isLoading;
  final String message;
  final List<DormsModel>? dorms;
  final bool? isFavourite;

  const FavoriteState({
    this.isLoading = false,
    this.message = '',
    this.dorms,
    this.isFavourite,
  });

  FavoriteState copyWith({
    bool? isLoading,
    String? message,
    List<DormsModel>? dorms,
    bool? isFavourite,
  }) {
    return FavoriteState(
      isLoading: isLoading ?? this.isLoading,
      message: message ?? this.message,
      dorms: dorms ?? this.dorms,
      isFavourite: isFavourite ?? this.isFavourite,
    );
  }
 }

