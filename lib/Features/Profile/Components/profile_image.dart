import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Core/Resources/icons.dart';
import '../../../Core/Resources/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';
import '../Cubit/profile_cubit.dart';

class ProfileImage extends StatefulWidget {
  const ProfileImage({super.key});

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  

  @override
  Widget build(BuildContext context) {
    final currentUser = context.read<ProfileCubit>().state.user;
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
                            child: Container(
                              width: 120.w,
                              height: 120.h,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child:
                                  currentUser?.profileImage == null
                                      ? Center(
                                        child: Text(
                                          (currentUser?.username != null &&
                                                  currentUser!
                                                      .username
                                                      .isNotEmpty)
                                              ? currentUser.username[0]
                                                  .toUpperCase()
                                              : 'U',
                                          style: AppTextStyle.photos,
                                        ),
                                      )
                                      : CachedNetworkImage(
                                        fadeInDuration: const Duration(
                                          milliseconds: 1400,
                                        ),
                                        fadeOutDuration: const Duration(
                                          milliseconds: 1400,
                                        ),
                                        imageUrl: currentUser!.profileImage!,
                                        width: 120.w,
                                        height: 120.h,
                                        fit: BoxFit.cover,
                                        placeholder:
                                            (context, url) => Container(
                                              color: Colors.grey[200],
                                              child: const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                            ),
                                        errorWidget:
                                            (context, url, error) => Container(
                                              color: Colors.grey[200],
                                              child: const Icon(
                                                Icons.broken_image,
                                                color: Colors.grey,
                                                size: 30,
                                              ),
                                            ),
                                      ),
                            ),
                          ),
                        ),
                      ),
                      15.verticalSpace,
                      Expanded(
                        child: Text(
                          currentUser?.username ?? 'Loading...',
                          style: AppTextStyle.semiBold16,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          currentUser?.email ?? 'Loading...',
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
