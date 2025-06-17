import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../Core/Components/custom_app_bar.dart';
import '../../Core/Components/custom_build_button_app.dart';
import '../../Core/Resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Core/Resources/text_style.dart';
import '../home/Data/Model/dorms_model.dart';
import '../home/View/Components/dorm_details_images.dart';

class InfoPage extends StatelessWidget {
  final DormsModel dorm;
  const InfoPage({super.key, required this.dorm});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Dormitory Details"),
      floatingActionButton: _buildFavoriteButton(),
      body: _buildBody(),
      persistentFooterButtons: [_buildFooterButton()],
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.w, 16.h, 16.w, 0),
      child: ListView(
        shrinkWrap: true,
        children: [
          _buildHeaderImage(),
          _buildDormitoryTitle(),
          _buildDormitoryLocation(),
          _buildDormitoryRating(),
          _buildDormitoryDescription(),
          _buildDormitoryInfo(),
          if (dorm.icerik.isNotEmpty || dorm.icerik2.isNotEmpty)
            _buildAdditionalInfo(),
          if (dorm.imkan1.isNotEmpty || dorm.imkan2.isNotEmpty)
            _buildFacilities(),
          _buildLocationAccessibilityCard(),
          _buildRoomPreviewSection(),
        ],
      ),
    );
  }

  Widget _buildFavoriteButton() {
    return FloatingActionButton(
      onPressed: () {
      },
      backgroundColor: AppColor.primaryColors,
      tooltip: 'Add to Favorites',
      child: Icon(Icons.favorite_border, color: Colors.white, size: 24),
    );
  }

  Widget _buildHeaderImage() {
    return Padding(
      padding: EdgeInsets.all(2.r),
      child: DormDetailsImages(dorm: dorm),
    );
  }

  Widget _buildDormitoryTitle() {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 8.h, 0, 0),
      child: Text(
        dorm.name,
        style: AppTextStyle.medium16.copyWith(
          fontWeight: FontWeight.w500,
          color: AppColor.primaryColors,
        ),
      ),
    );
  }

  Widget _buildDormitoryLocation() {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 4.h, 0, 0),
      child: Row(
        children: [
          Icon(Icons.location_on, size: 16, color: Colors.red),
          SizedBox(width: 4.w),
          Expanded(
            child: Text(
              dorm.address?.toString() ?? dorm.city,
              style: AppTextStyle.semiBold12Black.copyWith(color: Colors.red),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDormitoryRating() {
    final rating = double.tryParse(dorm.rating) ?? 0.0;
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 8.h, 0, 0),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                RatingBarIndicator(
                  rating: rating,
                  itemBuilder:
                      (context, index) => Icon(Icons.star, color: Colors.amber),
                  itemCount: 5,
                  itemSize: 20.0,
                  direction: Axis.horizontal,
                ),
                SizedBox(width: 8.w),
                Text(
                  rating > 0 ? rating.toStringAsFixed(1) : 'No rating',
                  style: AppTextStyle.semiBold12Black,
                ),
                SizedBox(width: 4.w),
                Text(
                  '(${rating > 0 ? 'Rated' : 'Not rated'})',
                  style: AppTextStyle.normal13.copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),
          _buildInlineFavoriteButton(),
        ],
      ),
    );
  }

  Widget _buildInlineFavoriteButton() {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.primaryColors.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: AppColor.primaryColors.withValues(alpha: 0.3),
        ),
      ),
      child: IconButton(
        onPressed: () {
          // You can implement the favorite logic later
        },
        icon: Icon(
          Icons.favorite_border,
          color: AppColor.primaryColors,
          size: 20,
        ),
        tooltip: 'Add to Favorites',
        padding: EdgeInsets.all(8.r),
        constraints: BoxConstraints(minWidth: 40.w, minHeight: 40.h),
      ),
    );
  }

  Widget _buildDormitoryDescription() {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 8.h, 0, 12.h),
      child: Text(
        dorm.description.isNotEmpty
            ? dorm.description
            : "No description available for this dormitory.",
        style: AppTextStyle.normal13,
      ),
    );
  }

  Widget _buildDormitoryInfo() {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 8.h, 0, 12.h),
      child: Container(
        width: 1.sw,
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: AppColor.secondColors,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.grey.shade300, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '🏠 Dormitory Information',
              style: AppTextStyle.normal13.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12.h),
            _buildInfoRow('Type', dorm.dormType),
            _buildInfoRow('City', dorm.city),
            if (dorm.roomType.isNotEmpty)
              _buildInfoRow('Room Type', dorm.roomType),
            if (dorm.budget > 0) _buildInfoRow('Budget', '${dorm.budget} TL'),
            if (dorm.price != null) _buildInfoRow('Price', '${dorm.price} TL'),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 4.h, 0, 4.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80.w,
            child: Text(
              '$label:',
              style: AppTextStyle.normal13.copyWith(
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
          ),
          Expanded(child: Text(value, style: AppTextStyle.normal13)),
        ],
      ),
    );
  }

  Widget _buildAdditionalInfo() {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 8.h, 0, 12.h),
      child: Container(
        width: 1.sw,
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: AppColor.secondColors,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.grey.shade300, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '📋 Additional Information',
              style: AppTextStyle.normal13.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12.h),
            if (dorm.icerik.isNotEmpty) ...[
              Text(dorm.icerik, style: AppTextStyle.normal13),
              if (dorm.icerik2.isNotEmpty) SizedBox(height: 8.h),
            ],
            if (dorm.icerik2.isNotEmpty)
              Text(dorm.icerik2, style: AppTextStyle.normal13),
          ],
        ),
      ),
    );
  }

  Widget _buildFacilities() {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 8.h, 0, 12.h),
      child: Container(
        width: 1.sw,
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: AppColor.secondColors,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.grey.shade300, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '🏢 Facilities & Amenities',
              style: AppTextStyle.normal13.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12.h),
            if (dorm.imkan1.isNotEmpty) ...[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.check_circle, color: Colors.green, size: 16),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Text(dorm.imkan1, style: AppTextStyle.normal13),
                  ),
                ],
              ),
              if (dorm.imkan2.isNotEmpty) SizedBox(height: 8.h),
            ],
            if (dorm.imkan2.isNotEmpty)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.check_circle, color: Colors.green, size: 16),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Text(dorm.imkan2, style: AppTextStyle.normal13),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationAccessibilityCard() {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12.h),
      child: Container(
        width: 1.sw,
        height: 200.h,
        constraints: BoxConstraints(maxWidth: 570.w),
        decoration: BoxDecoration(
          color: AppColor.secondColors,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.grey.shade300, width: 1),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLocationTitle(),
              _buildLocationDetails(),
              _buildParkingInfo(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLocationTitle() {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16.w, 4.h),
      child: Text(
        '📍 Location & Accessibility',
        style: AppTextStyle.normal13.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildLocationDetails() {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4.h),
      child: Text(
        '• 100m from Kurtuluş Ankaray Station\n• 10 min walk to Kızılay city center\n• 2 stops to Kızılay via Ankaray\n• 5 min walk to Ankara University',
        style: AppTextStyle.normal13,
      ),
    );
  }

  Widget _buildParkingInfo() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        CustomBuildButtonApp(
          elevation: 0,
          text: "Parking",
          backgroundColor: AppColor.primaryColors,
          onPressed: () {},
          isSpace: false,
          size: Size(100.w, 32.h),
        ),
        20.horizontalSpace,
        Expanded(
          child: Text('249 spots remaining', style: AppTextStyle.normal13),
        ),
        Icon(
          Icons.chevron_right_rounded,
          color: Colors.grey.shade300,
          size: 24,
        ),
      ],
    );
  }

  Widget _buildRoomPreviewSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Dorm Room Preview', style: AppTextStyle.semiBold16),
        _buildRoomPreviewGallery(),
      ],
    );
  }

  Widget _buildRoomPreviewGallery() {
    if (!dorm.hasImages) {
      return Container(
        width: 1.sw,
        height: 80.h,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Center(
          child: Text(
            'No images available',
            style: AppTextStyle.normal13.copyWith(color: Colors.grey),
          ),
        ),
      );
    }

    return SizedBox(
      width: 1.sw,
      height: 80.h,
      child: ListView.builder(
        itemCount: dorm.images.length,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => _buildRoomPreviewItem(index),
      ),
    );
  }

  Widget _buildRoomPreviewItem(int index) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(2.w, 2.h, 12.w, 2.h),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: CachedNetworkImage(
          fadeInDuration: const Duration(milliseconds: 1400),
          fadeOutDuration: const Duration(milliseconds: 1400),
          imageUrl: dorm.images[index],
          width: 80.w,
          height: 80.h,
          fit: BoxFit.cover,
          placeholder:
              (context, url) => Container(
                color: Colors.grey[200],
                child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
              ),
          errorWidget:
              (context, url, error) => Container(
                color: Colors.grey[200],
                child: Icon(Icons.broken_image, color: Colors.grey, size: 30),
              ),
        ),
      ),
    );
  }

  Widget _buildFooterButton() {
    return Align(
      child: CustomBuildButtonApp(
        size: Size(.9.sw, 52.h),
        text: "Get In Touch",
        isSpace: false,
        backgroundColor: AppColor.primaryColors,
        onPressed: () {},
      ),
    );
  }
}
