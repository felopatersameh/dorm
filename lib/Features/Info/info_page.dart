import 'package:cached_network_image/cached_network_image.dart';
import '../../Core/Components/custom_app_bar.dart';
import '../../Core/Components/custom_build_button_app.dart';
import '../../Core/Resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Core/Resources/text_style.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Dormitory Details"),
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
          _buildDormitoryDescription(),
          _buildLocationAccessibilityCard(),
          _buildRoomPreviewSection(),
        ],
      ),
    );
  }

  Widget _buildHeaderImage() {
    return Padding(
      padding: EdgeInsets.all(2.r),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: Image.network(
          'https://i.imgur.com/eM7rLtu.jpeg',
          width: double.infinity,
          height: 230.h,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildDormitoryTitle() {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 8.h, 0, 0),
      child: Text(
        'Cebeci Özel Başkent Erkek Öğrenci Yurdu',
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
      child: Text(
        'Çankaya, Ankara',
        style: AppTextStyle.semiBold12Black.copyWith(color: Colors.red),
      ),
    );
  }

  Widget _buildDormitoryDescription() {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 8.h, 0, 12.h),
      child: Text(
        "Cebeci Özel Başkent Erkek Öğrenci Yurdu is a trusted boys' dormitory located in Çankaya, Ankara, offering students a secure, supportive, and peaceful environment to thrive both academically and personally. Founded in 1997 by a retired teacher, our facility operates independently and aligns with Atatürk's principles and modern education standards.\n\nWe provide 24/7 staff support, comfortable living spaces, and essential amenities such as Wi-Fi, study areas, and parking. Our aim is to create a family-like atmosphere where students feel at home.",
        style: AppTextStyle.normal13,
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
    return SizedBox(
      width: 1.sw,
      height: 80.h,
      child: ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => _buildRoomPreviewItem(),
      ),
    );
  }

  Widget _buildRoomPreviewItem() {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(2.w, 2.h, 12.w, 2.h),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: CachedNetworkImage(
          fadeInDuration: const Duration(milliseconds: 1400),
          fadeOutDuration: const Duration(milliseconds: 1400),
          imageUrl:
              'https://images.unsplash.com/photo-1555854877-bab0e564b8d5?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw1fHxkb3JtfGVufDB8fHx8MTc0MTAwODk5M3ww&ixlib=rb-4.0.3&q=80&w=1080',
          width: 80.w,
          height: 80.h,
          fit: BoxFit.cover,
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
