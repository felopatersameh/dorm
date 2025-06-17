import '../../../../Core/Routes/app_routes.dart';
import '../../../../main.dart';

import '../../../../Core/Resources/colors.dart';
import '../../../../Core/Resources/text_style.dart';
import '../../Data/Model/dorms_model.dart';
import 'dorm_image_widget.dart';
import 'enum.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class BuildCardItems extends StatelessWidget {
  final TypeCards typeCards;
  final DormsModel? dormsModel;
  const BuildCardItems({super.key, required this.typeCards, this.dormsModel});

  @override
  Widget build(BuildContext context) {
    return dormsModel == null
        ? const SizedBox()
        : Padding(
          padding: typeCards.padding,
          child: InkWell(
            onTap:
                () => kNavigationService.navigateTo(
                  AppRoutes.infoPage,
                  arguments: dormsModel,
                ),
            child: Container(
              width: (typeCards.width).w,
              height: typeCards.height?.h,
              decoration: BoxDecoration(
                color: AppColor.secondColors,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 8,
                    color: Color(0x230F1113),
                    offset: Offset(0.0, 4),
                  ),
                ],
                borderRadius: BorderRadius.circular(12).r,
                border: Border.all(color: AppColor.secondColors, width: 1),
              ),
              child:dormsModel == null ? const SizedBox() :  Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    child: DormImageWidget(
                      dorm: dormsModel!,
                      width: 1.sw,
                      height: (typeCards.heightImage).h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                0,
                                0,
                                1,
                                0,
                              ),
                              child: Text(
                                dormsModel!.name,
                                style: AppTextStyle.normal13.copyWith(
                                  color: AppColor.primaryColors,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                0,
                                8,
                                0,
                                0,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  RatingBarIndicator(
                                    itemBuilder:
                                        (context, index) => Icon(
                                          Icons.radio_button_checked_rounded,
                                          color: AppColor.primaryColors,
                                        ),
                                    direction: Axis.horizontal,
                                    rating:
                                        double.tryParse(dormsModel!.rating) ??
                                        0.0,
                                    unratedColor: Colors.grey,
                                    itemCount: 5,
                                    itemSize: 16,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      8,
                                      0,
                                      0,
                                      0,
                                    ),
                                    child: Text(
                                      dormsModel!.rating,
                                      style: AppTextStyle.semiBold12Black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
  }
}
