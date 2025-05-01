import '../../../Core/Resources/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageInternetConnection extends StatelessWidget {
  const MessageInternetConnection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          25.verticalSpace,
          SizedBox(
            width: .4.sw,
            child: Text(
              "Please Check Your Internet Connection And Try Again",
              textAlign: TextAlign.center,
              style: AppTextStyle.normal13,
            ),
          ),
        ],
      ),
    );
  }
}
