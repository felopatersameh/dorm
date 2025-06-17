part of 'home_cubit.dart';


 class HomeState {
  final bool isLoading;
  final String message;
  final List<DormsModel>? dorms;
  final List<DormsModel>? featuredDorms;
  final List<DormsModel>? nerbyDorms;

  const HomeState({
    this.isLoading = false,
    this.message = '',
    this.dorms,
    this.featuredDorms,
    this.nerbyDorms,
  });

  HomeState copyWith({
    bool? isLoading,
    String? message,
    List<DormsModel>? dorms,
    List<DormsModel>? featuredDorms,
    List<DormsModel>? nerbyDorms,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      message: message ?? this.message,
      dorms: dorms ?? this.dorms,
      featuredDorms: featuredDorms ?? this.featuredDorms,
      nerbyDorms: nerbyDorms ?? this.nerbyDorms,
    );
  }
 }


