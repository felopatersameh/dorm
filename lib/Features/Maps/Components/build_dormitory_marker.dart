import '../../../Core/Routes/app_routes.dart';
import '../../../main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';
import '../../../Core/Services/distance_service.dart';
import '../../home/Data/Model/dorms_model.dart';

Marker buildDormitoryMarker(
  LatLng position,
  String title, {
  double? distanceInKm,
  required DormsModel dorm,
}) {
  return Marker(
    point: position,
    width: 200.w,
    height: 80.h,
    child: GestureDetector(
      onTap: () {
        kNavigationService.navigateTo(AppRoutes.infoPage , arguments: dorm);
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4).r,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(40),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                  ),
                ),
                if (distanceInKm != null) ...[
                  2.verticalSpace,
                  Text(
                    DistanceService.formatDistance(distanceInKm),
                    style: TextStyle(
                      color: Colors.green[700],
                      fontWeight: FontWeight.w600,
                      fontSize: 10.sp,
                    ),
                  ),
                ],
              ],
            ),
          ),
          4.verticalSpace,
          Container(
            width: 30.w,
            height: 30.h,
            decoration: BoxDecoration(
              color: _getMarkerColor(distanceInKm),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(40),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Icon(Icons.home, color: Colors.white, size: 16),
          ),
        ],
      ),
    ),
  );
}

Color _getMarkerColor(double? distanceInKm) {
  if (distanceInKm == null) return Colors.orange;

  final category = DistanceService.getDistanceCategory(distanceInKm);
  switch (category) {
    case DistanceCategory.veryClose:
      return Colors.green;
    case DistanceCategory.close:
      return Colors.orange;
    case DistanceCategory.medium:
      return Colors.blue;
    case DistanceCategory.far:
      return Colors.red;
  }
}
