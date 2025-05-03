import '../../../Core/Resources/colors.dart';
import '../cubit/maps_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';

Marker buildUserMarker(MapsState state) {
  return Marker(
    point: LatLng(
      state.locationData!.latitude!,
      state.locationData!.longitude!,
    ),
    width: 600.w,
    height: 60.h,
    child: Container(
      decoration: BoxDecoration(
        color: AppColor.primaryColors.withAlpha(50),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.primaryColors,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 2),
          ),
          width: 20.w,
          height: 20.h,
        ),
      ),
    ),
  );
}
