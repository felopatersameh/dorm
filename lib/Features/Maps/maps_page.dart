import 'Components/build_dormitory_marker.dart';
import 'Components/build_user_marker.dart';
import 'Components/button_get_location.dart';

import 'cubit/maps_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import 'cubit/maps_cubit.dart';

class MapsPage extends StatelessWidget {
  const MapsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapsCubit, MapsState>(
      builder: (context, state) {
        if (state.locationData == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return Stack(
          children: [
            FlutterMap(
              mapController: context.read<MapsCubit>().mapController,
              options: MapOptions(
                initialZoom: 5,
                initialCenter: LatLng(
                  state.locationData?.latitude ?? 39.9334,
                  state.locationData?.longitude ?? 32.8597,
                ),
                onMapReady: () => context.read<MapsCubit>().onMapReady(),
                interactionOptions: const InteractionOptions(
                  flags: InteractiveFlag.all,
                ),
              ),

              children: [
                TileLayer(
                  fallbackUrl: 'https://tile.thunderforest.com/atlas/{z}/{x}/{y}.png?apikey=6170aad10dfd42a38d4d8c709a536f38',
                  
                  urlTemplate:
                      'https://tile.thunderforest.com/atlas/{z}/{x}/{y}.png?apikey=6170aad10dfd42a38d4d8c709a536f38',
                  userAgentPackageName: "com.example.dorm",
               
                  tileProvider: NetworkTileProvider(),
                  // Enable file caching
                  keepBuffer: 5,

                ),

                MarkerLayer(markers: [buildUserMarker(state)]),

                MarkerLayer(
                  markers: [
                    buildDormitoryMarker(
                      LatLng(
                        state.locationData!.latitude! + 0.002,
                        state.locationData!.longitude! + 0.002,
                      ),
                      "Place 1 ",
                    ),
                    buildDormitoryMarker(
                      LatLng(
                        state.locationData!.latitude! - 0.003,
                        state.locationData!.longitude! + 0.001,
                      ),
                      "Place 2",
                    ),
                    buildDormitoryMarker(
                      LatLng(
                        state.locationData!.latitude! + 0.001,
                        state.locationData!.longitude! - 0.002,
                      ),
                      "Place 3",
                    ),
                  ],
                ),
              ],
            ),

            ButtonGetLocation(),
          ],
        );
      },
    );
  }
}
