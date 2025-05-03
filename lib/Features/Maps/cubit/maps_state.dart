
import 'package:location/location.dart';

class MapsState {
  final LocationData? locationData;
  final bool isLoading;
  const MapsState({this.locationData, this.isLoading = false});
  MapsState copyWith({LocationData? locationData, bool? isLoading}) {
    return MapsState(
      locationData: locationData ?? this.locationData,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
