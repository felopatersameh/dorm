import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Core/Routes/app_routes.dart';
import '../../../main.dart';

import '../../../Core/Resources/colors.dart';
import '../../../Core/Resources/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../home/Data/Model/dorms_model.dart';
import '../cubit/favorite_cubit.dart';

class BuildCardFavorites extends StatelessWidget {
  final DormsModel? dormsModel;
  const BuildCardFavorites({super.key, this.dormsModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, top: 8.h, right: 16.w, bottom: 0),
      child: InkWell(
        onTap: () => kNavigationService.navigateTo(AppRoutes.infoPage),
        child: Container(
          height: 150.h,
          decoration: BoxDecoration(
            color: AppColor.secondColors,
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: Color(0x320E151B),
                offset: Offset(0.0, 1),
              ),
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: 12.w,
              top: 8.h,
              right: 8.w,
              bottom: 8.h,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Hero(
                  tag: 'ControllerImage_${dormsModel?.id}',
                  transitionOnUserGestures: true,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      fadeInDuration: Duration(milliseconds: 1400),
                      fadeOutDuration: Duration(milliseconds: 1400),
                      imageUrl:
                          dormsModel?.firstImage ??
                          'https://via.placeholder.com/90x100?text=No+Image',
                      width: 90.w,
                      height: 100.h,
                      fit: BoxFit.cover,
                      placeholder:
                          (context, url) => Container(
                            width: 90.w,
                            height: 100.h,
                            color: Colors.grey[200],
                            child: Center(
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                          ),
                      errorWidget:
                          (context, url, error) => Container(
                            width: 90.w,
                            height: 100.h,
                            color: Colors.grey[200],
                            child: Icon(
                              Icons.image_not_supported,
                              color: Colors.grey,
                              size: 30,
                            ),
                          ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 12.w,
                      top: 0,
                      right: 0,
                      bottom: 0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dormsModel?.name ?? 'Unknown Dorm',
                          style: AppTextStyle.normal16,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 14,
                              color: Colors.red,
                            ),
                            SizedBox(width: 4.w),
                            Expanded(
                              child: Text(
                                'Location: ${dormsModel?.city ?? 'Unknown'}',
                                style: AppTextStyle.normal13.copyWith(
                                  color: Colors.red,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.home, size: 14, color: Colors.grey[600]),
                            SizedBox(width: 4.w),
                            Expanded(
                              child: Text(
                                'Type: ${dormsModel?.dormType ?? 'Unknown'}',
                                style: AppTextStyle.normal13.copyWith(
                                  color: Colors.grey[600],
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.markunread,
                    color: Color(0xFF1E3A8A),
                    size: 20,
                  ),
                  onPressed: () {
                    // print('IconButton pressed ...');
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.delete_outline_rounded,
                    color: Colors.red,
                    size: 20,
                  ),
                  onPressed: () {
                    context.read<FavoriteCubit>().deleteFavorite(
                      dormsModel!.id,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
