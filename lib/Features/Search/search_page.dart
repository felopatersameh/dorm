import '../../Core/Components/build_animatedview_list_box.dart';
import '../../Core/Resources/colors.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../home/Components/build_card_items.dart';
import '../home/Components/enum.dart';
import 'Components/build_search_bar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? _selectedPropertyType;
  String? _selectedPriceRange;

  final List<String> _propertyTypes = [
    'Apartment',
    'House',
    'Condo',
    'Villa',
    'Studio',
  ];
  final List<String> _priceRanges = [
    '\$0-\$500',
    '\$500-\$1000',
    '\$1000-\$1500',
    '\$1500-\$2000',
    '\$2000+',
  ];

  Widget _buildDropdownMenu(String title) {
    List<String> items =
        title == 'Property Type' ? _propertyTypes : _priceRanges;
    String? selectedValue =
        title == 'Property Type' ? _selectedPropertyType : _selectedPriceRange;

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(12.w, 12.h, 12.w, 12.h),
      child: Container(
        width: 150.w,
        height: 40.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Color(0xFFE0E0E0)),
        ),
        padding: EdgeInsetsDirectional.fromSTEB(20.w, 0, 0, 0),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: selectedValue,
            hint: Text(title),
            icon: Icon(Icons.arrow_drop_down),
            isExpanded: true,

            onChanged: (String? newValue) {
              setState(() {
                if (title == 'Property Type') {
                  _selectedPropertyType = newValue;
                } else {
                  _selectedPriceRange = newValue;
                }
              });
            },
            dropdownColor: AppColor.secondColors,
            borderRadius: BorderRadius.all(Radius.circular(15.r)),
            items:
                items.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(180.h),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                BuildSearchBar(enable: true),
                30.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildDropdownMenu('Property Type'),
                    _buildDropdownMenu('Price Range'),
                  ],
                ),

                Divider(),
              ],
            ),
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.zero,
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: 3,
        itemBuilder:
            (context, index) => BuildAnimatedview(
              index: index,
              animationType: AnimationType.fadeOnly,
              child: BuildCardItems(typeCards: TypeCards.big),
            ),
      ),
    );
  }
}
