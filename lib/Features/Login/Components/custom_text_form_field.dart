import 'package:dorm/Core/Resources/colors.dart';
import 'package:dorm/Core/Resources/icons.dart';
import 'package:dorm/Core/Resources/text_style.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final bool? obscureText;
  final bool? showSuffix;
  final void Function()? onTap;
  const CustomTextFormField({
    super.key,
    required this.title,
    this.validator,
    this.keyboardType,
    this.controller,
    this.obscureText, this.onTap, this.showSuffix=false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
      child: TextFormField(
        controller: controller,
        autofocus: true,
        autofillHints: [AutofillHints.email],
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
          labelText: title,
          labelStyle: AppTextStyle.semiBold12Black,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.alternate, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.alternate, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),

          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          filled: true,
          fillColor: AppColor.secondColors,
          contentPadding: EdgeInsets.all(24),
          suffixIcon:
              showSuffix == true
                  ? InkWell(
                    onTap: onTap,
                    focusNode: FocusNode(skipTraversal: true),
                    child: Icon(
                      obscureText == true
                      ? AppIcons.passwordvisibility:
                     AppIcons.passwordvisibilityOff,
                      color: AppColor.alternate,
                      size: 24,
                    ),
                  )
                  : SizedBox(),
        ),
        style: AppTextStyle.semiBold12Black,
        keyboardType: keyboardType,
        validator: validator,
      ),
    );
  }
}
