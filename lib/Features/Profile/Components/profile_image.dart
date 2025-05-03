import 'package:cached_network_image/cached_network_image.dart';
import '../../../Core/Resources/icons.dart';
import '../../../Core/Resources/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
      width: 1.sw,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.w, 0, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(1000.r),
                          bottomRight: Radius.circular(1000.r),
                          topLeft: Radius.circular(1000.r),
                          topRight: Radius.circular(1000.r),
                        ),
                        child: Container(
                          width: 120.w,
                          height: 120.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(1000.r),
                              bottomRight: Radius.circular(1000.r),
                              topLeft: Radius.circular(1000.r),
                              topRight: Radius.circular(1000.r),
                            ),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Container(
                              width: 120.w,
                              height: 120.h,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child: CachedNetworkImage(
                                fadeInDuration: const Duration(
                                  milliseconds: 1400,
                                ),
                                fadeOutDuration: const Duration(
                                  milliseconds: 1400,
                                ),
                                imageUrl:
                                    'https://images.unsplash.com/photo-1588516903720-8ceb67f9ef84?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxNXx8d29tZW58ZW58MHx8fHwxNzQwMzk2MzYzfDA&ixlib=rb-4.0.3&q=80&w=1080',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                      15.verticalSpace,
                      Expanded(
                        child: Text(
                          'Alexander Smith',
                          style: AppTextStyle.semiBold16,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Alex.SMith@gmail.com',
                          style: AppTextStyle.normal13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: IconButton(icon: AppIcons.edit, onPressed: () {}),
          ),
        ],
      ),
    );
  }
}
