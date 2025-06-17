import '../Resources/text_style.dart';
import 'package:flutter/material.dart';

class CustomBuildButtonApp extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final Color backgroundColor;
  final Widget? icon;
  final Color textColor;
  final void Function()? onPressed;
  final bool isSpace;
  final Size? size;
  final double? radius;
  final Color? radiusColor;
  final double? elevation;
  final bool? looding;

  const CustomBuildButtonApp({
    super.key,
    required this.text,
    required this.backgroundColor,
    this.textColor = Colors.white,
    required this.onPressed,
    this.isSpace = true,
    this.size,
    this.textStyle,
    this.radius,
    this.radiusColor,
    this.elevation,
    this.icon, this.looding,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: WidgetStatePropertyAll(size ?? Size(230, 52)),
        backgroundColor: WidgetStatePropertyAll(backgroundColor),
        elevation: WidgetStatePropertyAll(elevation ?? 5),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(radius ?? 20),
            side: BorderSide(color: radiusColor ?? Color(0xffEFEFEF)),
          ),
        ),
      ),
      onPressed: onPressed ?? () {},
      child:looding==true?Center(child: CircularProgressIndicator()): Row(
        mainAxisAlignment:
            isSpace ? MainAxisAlignment.start : MainAxisAlignment.center,
        children: [
          isSpace ? icon! : SizedBox(),
          isSpace ? SizedBox(width: 37) : SizedBox(),
          Expanded(
            child: Align(
              child: Text(
                text,
                maxLines: text.length,
                textAlign: TextAlign.center,
                softWrap: true,
                style:
                    textStyle ??
                    AppTextStyle.normal13.copyWith(color: textColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

