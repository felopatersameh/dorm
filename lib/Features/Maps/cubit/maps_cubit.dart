import 'package:bloc/bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

import '../../../Core/Services/location_service.dart';
import 'maps_state.dart';

class MapsCubit extends Cubit<MapsState> {
  MapsCubit() : super(MapsState());

  MapController mapController = MapController();
  bool _isMapInitialized = false;
  LocationData? _cachedLocationData;

  void onMapReady() {
    _isMapInitialized = true;
    if (_cachedLocationData != null) {
      _moveToUserLocation(_cachedLocationData!);
    }
  }

  Future<void> getlocationData() async {
    emit(state.copyWith(isLoading: true));
    try {
      LocationService locationService = LocationService();
      final locationData = await locationService.getLocation();

      emit(state.copyWith(locationData: locationData, isLoading: false));

      _cachedLocationData = locationData;

      if (_isMapInitialized) {
        _moveToUserLocation(locationData);
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }

  void _moveToUserLocation(LocationData locationData) {
    try {
      if (locationData.latitude != null &&
          locationData.longitude != null &&
          !locationData.latitude!.isNaN &&
          !locationData.longitude!.isNaN &&
          locationData.latitude!.isFinite &&
          locationData.longitude!.isFinite) {
        final userLocation = LatLng(
          locationData.latitude!,
          locationData.longitude!,
        );
        mapController.move(userLocation, 15.0);
      }
    } catch (e) {
      // Log error
    }
  }
}
