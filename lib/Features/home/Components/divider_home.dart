import 'package:flutter/Material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DividerHome extends StatelessWidget {
  const DividerHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 8.h,
      thickness: 4,
      indent: 140,
      endIndent: 140,
      color: Color(0xffe0e3e7),
    );
  }
}
