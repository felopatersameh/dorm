import 'cubit/favorite_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Core/Components/build_animatedview_list_box.dart';
import 'Components/build_card_favorites.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Core/Resources/text_style.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {

  @override
  void initState() {
    super.initState();
    context.read<FavoriteCubit>().getfavourites();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
    
        if (state.dorms == null || state.dorms!.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.favorite_border,
                  size: 80,
                  color: Colors.grey[400],
                ),
                SizedBox(height: 16),
                Text(
                  'No favorite dorms yet',
                  style: AppTextStyle.normal16.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Start adding dorms to your favorites!',
                  style: AppTextStyle.normal13.copyWith(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          );
        }
    
        return ListView(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.w, 16.h, 16.w, 8.h),
              child: Text(
                'Your Favorite Dorms (${state.dorms!.length})',
                style: AppTextStyle.normal16.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.w, 0, 16.w, 16.h),
              child: Text(
                'Keep track of your favorite dorms here',
                style: AppTextStyle.normal13.copyWith(
                  color: Colors.grey[600],
                ),
              ),
            ),
            ...List.generate(
              state.dorms!.length,
              (index) => BuildAnimatedview(
                index: index,
                animationType: AnimationType.rightToLeft,
                child: BuildCardFavorites(dormsModel: state.dorms![index]),
              ),
            ),
          ],
        );
      },
    );
  }
}
