import 'package:bloc/bloc.dart';

import '../../../Core/Services/local_favorites_service.dart';
import '../../home/Data/Model/dorms_model.dart';
import '../Repo/repository_impl_favorite.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this.repositoryImplFavorite) : super(FavoriteState());
  final RepositoryImplFavorite repositoryImplFavorite;

  Future<void> getfavourites() async {
    emit(state.copyWith(isLoading: true));

    try {
      // First, get favorites from local storage
      final localFavorites = await LocalFavoritesService.getFavorites();

      // Emit local favorites immediately for better UX
      if (localFavorites.isNotEmpty) {
        emit(state.copyWith(isLoading: false, dorms: localFavorites));
      }

      // Then try to get from server and sync
      final response = await repositoryImplFavorite.getfavourites();
      response.fold(
        (l) {
          // If server fails but we have local data, keep local data
          if (localFavorites.isNotEmpty) {
            emit(
              state.copyWith(
                isLoading: false,
                message: 'Using offline favorites',
              ),
            );
          } else {
            emit(state.copyWith(isLoading: false, message: l.message));
          }
        },
        (r) {
          // Sync server data with local storage
          LocalFavoritesService.syncWithServer(r);
          emit(state.copyWith(isLoading: false, dorms: r));
        },
      );
    } catch (e) {
      // Fallback to local favorites if everything fails
      final localFavorites = await LocalFavoritesService.getFavorites();
      emit(
        state.copyWith(
          isLoading: false,
          dorms: localFavorites,
          message:
              localFavorites.isNotEmpty
                  ? 'Using offline favorites'
                  : 'Failed to load favorites',
        ),
      );
    }
  }

  Future<void> postfavourites(int id) async {
    emit(state.copyWith(isLoading: true));

    // final response = await repositoryImplFavorite.postfavourites();
    // response.fold(
    //   (l) => emit(state.copyWith(isLoading: false, message: l.message)),
    //   (r) => emit(state.copyWith(isLoading: false, isFavourite: r)),
    // );

    emit(
      state.copyWith(
        isLoading: false,
        isFavourite: true,
        dorms: state.dorms!..removeWhere((element) => element.id == id),
      ),
    );
  }

  /// Check if a specific dorm is in favorites (for InfoPage)
  Future<void> checkFavoriteStatus(int dormId) async {
    try {
      final isFavorite = await LocalFavoritesService.isFavorite(dormId);
      emit(state.copyWith(isFavourite: isFavorite));
    } catch (e) {
      emit(state.copyWith(isFavourite: false));
    }
  }

  /// Toggle favorite status with local storage
  Future<void> toggleFavorite(DormsModel dorm) async {
    try {
      final isCurrentlyFavorite = await LocalFavoritesService.isFavorite(
        dorm.id,
      );

      if (isCurrentlyFavorite) {
        // Remove from favorites
        final success = await LocalFavoritesService.removeFromFavorites(
          dorm.id,
        );
        if (success) {
          emit(
            state.copyWith(
              isFavourite: false,
              message: 'Removed from favorites',
            ),
          );
        }
      } else {
        // Add to favorites
        final success = await LocalFavoritesService.addToFavorites(dorm);
        if (success) {
          emit(
            state.copyWith(isFavourite: true, message: 'Added to favorites'),
          );
        }
      }

      // Try to sync with server in background
      _syncWithServer(dorm.id);
    } catch (e) {
      emit(state.copyWith(message: 'Failed to update favorites'));
    }
  }

  /// Background sync with server
  Future<void> _syncWithServer(int dormId) async {
    try {
      final response = await repositoryImplFavorite.postfavourites();
      response.fold(
        (l) {
          // Server sync failed, but local update succeeded
          emit(
            state.copyWith(message: 'Saved '),
          );
        },
        (r) {
          // Server sync succeeded
          emit(state.copyWith(message: 'Synced with server'));
        },
      );
    } catch (e) {
      // Ignore server sync errors since local storage worked
    }
  }

    Future<void> clearFavorites() async {
    try {
      final success = await LocalFavoritesService.clearFavorites();
      if (success) {
        emit(state.copyWith(dorms: []));
      }
    } catch (e) {
      emit(state.copyWith(message: 'Failed to clear favorites'));
    }
  }

    Future<void> deleteFavorite(int dormId) async {
    try {
      final success = await LocalFavoritesService.removeFromFavorites(dormId);
      if (success) {
        emit(
          state.copyWith(
            dorms: state.dorms!.where((dorm) => dorm.id != dormId).toList(),
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(message: 'Failed to delete favorite'));
    }
  }
}

