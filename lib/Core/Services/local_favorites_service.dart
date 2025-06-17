import 'package:hive_flutter/hive_flutter.dart';
import '../../Features/home/Data/Model/dorms_model.dart';
import '../../Features/home/Data/Model/dorms_model_adapter.dart';

class LocalFavoritesService {
  static const String _favoritesBoxName = 'favorite_dorms';
  static const String _favoriteIdsBoxName = 'favorite_dorm_ids';

  static Box<DormsModel>? _favoritesBox;
  static Box<int>? _favoriteIdsBox;

  static Future<void> init() async {
    await Hive.initFlutter();

    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(DormsModelAdapter());
    }

    _favoritesBox = await Hive.openBox<DormsModel>(_favoritesBoxName);
    _favoriteIdsBox = await Hive.openBox<int>(_favoriteIdsBoxName);
  }

  static Future<void> _ensureInitialized() async {
    if (_favoritesBox == null || _favoriteIdsBox == null) {
      await init();
    }
  }

  static Future<bool> addToFavorites(DormsModel dorm) async {
    try {
      await _ensureInitialized();

      if (await isFavorite(dorm.id)) {
        return true; // Already in favorites
      }

      await _favoritesBox!.put(dorm.id, dorm);
      await _favoriteIdsBox!.add(dorm.id);

      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> removeFromFavorites(int dormId) async {
    try {
      await _ensureInitialized();

      await _favoritesBox!.delete(dormId);

      final ids = _favoriteIdsBox!.values.toList();
      final index = ids.indexOf(dormId);
      if (index != -1) {
        await _favoriteIdsBox!.deleteAt(index);
      }

      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<List<DormsModel>> getFavorites() async {
    try {
      await _ensureInitialized();
      return _favoritesBox!.values.toList();
    } catch (e) {
      return [];
    }
  }

  static Future<List<int>> getFavoriteIds() async {
    try {
      await _ensureInitialized();
      return _favoriteIdsBox!.values.toList();
    } catch (e) {
      return [];
    }
  }

  static Future<bool> isFavorite(int dormId) async {
    try {
      await _ensureInitialized();
      return _favoritesBox!.containsKey(dormId);
    } catch (e) {
      return false;
    }
  }

  static Future<bool> clearFavorites() async {
    try {
      await _ensureInitialized();
      await _favoritesBox!.clear();
      await _favoriteIdsBox!.clear();
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<int> getFavoritesCount() async {
    try {
      await _ensureInitialized();
      return _favoritesBox!.length;
    } catch (e) {
      return 0;
    }
  }

  static Future<void> syncWithServer(List<DormsModel> serverFavorites) async {
    try {
      await _ensureInitialized();

      // Clear existing data
      await _favoritesBox!.clear();
      await _favoriteIdsBox!.clear();

      // Add server favorites
      for (final dorm in serverFavorites) {
        await _favoritesBox!.put(dorm.id, dorm);
        await _favoriteIdsBox!.add(dorm.id);
      }
    } catch (e) {
      return;
    }
  }
}
