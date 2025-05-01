part of 'main_pages_cubit.dart';

class MainPagesState {
  final int index;
    final bool internet;

  const MainPagesState({ this.index = 0,this.internet =false});

  MainPagesState copyWith({final int? index, final bool? internet}) {
    return MainPagesState(index: index ?? this.index,internet: internet ?? this.internet);
  }
}
