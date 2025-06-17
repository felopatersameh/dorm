
import 'package:bloc/bloc.dart';
import 'package:location/location.dart';

import '../../../../Core/Services/location_service.dart';
import '../../Data/Model/dorms_model.dart';
import '../../Data/Repo/repository_impl_home.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepositoryImpl) : super(HomeState());
  final HomeRepositoryImpl homeRepositoryImpl;

  Future<LocationData> getLoction() async {
    LocationService locationService = LocationService();
    final locationData = await locationService.getLocation();
    return locationData;
  }

  init() async {
   await getAllDorms();
   await getNearbyDorms();
  }

  Future<void> getAllDorms() async {
    emit(state.copyWith(isLoading: true));

    final response = await homeRepositoryImpl.getAllDorms();
    response.fold(
      (l) => emit(state.copyWith(isLoading: false, message: l.message)),
      (r) {
        List<DormsModel> featuredDorms = [];
        for (var element in r) {
          if (double.parse(element.rating) >= 3.5) {
            featuredDorms.add(element);
          }
        }
        emit(
          state.copyWith(
            isLoading: false,
            dorms: r,
            featuredDorms: featuredDorms,
          ),
        );
      },
    );
  } 
  
  Future<void> getNearbyDorms() async {

    final locationData = await getLoction();
    if (locationData.latitude == null || locationData.longitude == null) {
      return;
    }
    final response = await homeRepositoryImpl.getNearbyDorms(latitude: locationData.latitude!, longitude: locationData.longitude!);
    response.fold(
      (l) => emit(state.copyWith(isLoading: false, message: l.message)),
      (r) => emit(
          state.copyWith(
            isLoading: false,
            dorms: r,
            nerbyDorms: r,
          ),
        ),
    );
  }


}
