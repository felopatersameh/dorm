import 'dart:math';
import 'package:location/location.dart';
import 'package:latlong2/latlong.dart';

class DistanceService {
  static const double _earthRadius = 6371; // Earth's radius in kilometers

  /// Calculate distance between two points using Haversine formula
  /// Returns distance in kilometers
  static double calculateDistance(
    double lat1,
    double lon1,
    double lat2,
    double lon2,
  ) {
    // Convert degrees to radians
    final lat1Rad = _degreesToRadians(lat1);
    final lon1Rad = _degreesToRadians(lon1);
    final lat2Rad = _degreesToRadians(lat2);
    final lon2Rad = _degreesToRadians(lon2);

    // Haversine formula
    final dLat = lat2Rad - lat1Rad;
    final dLon = lon2Rad - lon1Rad;

    final a =
        sin(dLat / 2) * sin(dLat / 2) +
        cos(lat1Rad) * cos(lat2Rad) * sin(dLon / 2) * sin(dLon / 2);
    final c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return _earthRadius * c;
  }

  /// Calculate distance between user's current location and a target location
  /// Returns distance in kilometers
  static double calculateDistanceFromCurrentLocation(
    LocationData currentLocation,
    double targetLat,
    double targetLon,
  ) {
    if (currentLocation.latitude == null || currentLocation.longitude == null) {
      throw Exception('Current location coordinates are null');
    }

    return calculateDistance(
      currentLocation.latitude!,
      currentLocation.longitude!,
      targetLat,
      targetLon,
    );
  }

  /// Calculate distance between two LatLng points
  /// Returns distance in kilometers
  static double calculateDistanceBetweenLatLng(LatLng point1, LatLng point2) {
    return calculateDistance(
      point1.latitude,
      point1.longitude,
      point2.latitude,
      point2.longitude,
    );
  }

  /// Format distance for display
  /// Returns formatted string (e.g., "2.5 km", "500 m")
  static String formatDistance(double distanceInKm) {
    if (distanceInKm < 1) {
      final meters = (distanceInKm * 1000).round();
      return '$meters m';
    } else {
      return '${distanceInKm.toStringAsFixed(1)} km';
    }
  }

  /// Get distance category for sorting/filtering
  /// Returns DistanceCategory enum
  static DistanceCategory getDistanceCategory(double distanceInKm) {
    if (distanceInKm < 1) {
      return DistanceCategory.veryClose;
    } else if (distanceInKm < 3) {
      return DistanceCategory.close;
    } else if (distanceInKm < 10) {
      return DistanceCategory.medium;
    } else {
      return DistanceCategory.far;
    }
  }

  /// Sort locations by distance from current location
  static List<LocationWithDistance> sortByDistance(
    LocationData currentLocation,
    List<LocationWithDistance> locations,
  ) {
    locations.sort((a, b) => a.distance.compareTo(b.distance));
    return locations;
  }

  /// Filter locations within a certain radius
  static List<LocationWithDistance> filterByRadius(
    List<LocationWithDistance> locations,
    double maxDistanceInKm,
  ) {
    return locations
        .where((location) => location.distance <= maxDistanceInKm)
        .toList();
  }

  /// Convert degrees to radians
  static double _degreesToRadians(double degrees) {
    return degrees * (pi / 180);
  }
}

/// Enum for distance categories
enum DistanceCategory {
  veryClose, // < 1 km
  close, // 1-3 km
  medium, // 3-10 km
  far, // > 10 km
}

/// Data class to hold location with distance information
class LocationWithDistance {
  final String id;
  final String name;
  final double latitude;
  final double longitude;
  final double distance; // in kilometers
  final DistanceCategory category;

  LocationWithDistance({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.distance,
  }) : category = DistanceService.getDistanceCategory(distance);

  /// Create from dorm model with calculated distance
  factory LocationWithDistance.fromDormModel(
    dynamic dormModel,
    LocationData currentLocation,
  ) {
    final dormLat = double.tryParse(dormModel.latitude) ?? 0.0;
    final dormLon = double.tryParse(dormModel.longitude) ?? 0.0;

    final distance = DistanceService.calculateDistanceFromCurrentLocation(
      currentLocation,
      dormLat,
      dormLon,
    );

    return LocationWithDistance(
      id: dormModel.id.toString(),
      name: dormModel.name,
      latitude: dormLat,
      longitude: dormLon,
      distance: distance,
    );
  }

  /// Get formatted distance string
  String get formattedDistance => DistanceService.formatDistance(distance);

  /// Get category display name
  String get categoryName {
    switch (category) {
      case DistanceCategory.veryClose:
        return 'Very Close';
      case DistanceCategory.close:
        return 'Close';
      case DistanceCategory.medium:
        return 'Medium Distance';
      case DistanceCategory.far:
        return 'Far';
    }
  }
}
