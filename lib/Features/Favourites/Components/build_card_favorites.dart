import 'package:cached_network_image/cached_network_image.dart';

import '../../../Core/Routes/app_routes.dart';
import '../../../main.dart';

import '../../../Core/Resources/colors.dart';
import '../../../Core/Resources/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildCardFavorites extends StatelessWidget {
  const BuildCardFavorites({super.key});

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
            padding: EdgeInsets.only(left: 12.w, top: 8.h, right: 8.w, bottom: 8.h),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Hero(
                  tag: 'ControllerImage',
                  transitionOnUserGestures: true,
                  child: CachedNetworkImage(
                        fadeInDuration: Duration(milliseconds: 1400),
                        fadeOutDuration: Duration(milliseconds: 1400),
                    imageUrl: 'https://images.unsplash.com/photo-1574362848149-11496d93a7c7?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw2fHxkb3JtfGVufDB8fHx8MTc0MTAwODk5M3ww&ixlib=rb-4.0.3&q=80&w=1080',
                    width: 90.w,
                    height: 100.h,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 12.w, top: 0, right: 0, bottom: 0),
                    child: Column(
                      
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Yüksek Öğrenim Kız Öğrenci Yurdu',
                          style: AppTextStyle.normal16,
                        ),
                        Opacity(
                          opacity: 0.9,
                          child: Text(
                            'Location:Ankara',
                            style: AppTextStyle.normal13,
                          ),
                        ),
                        Opacity(
                          opacity: 0.4,
                          child: Text(
                            'Availability: 5 Rooms available',
                            style: AppTextStyle.normal13,
                          ),
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
                    // print('IconButton pressed ...');
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
