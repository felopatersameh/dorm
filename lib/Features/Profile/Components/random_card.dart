import '../../../Core/Resources/strings.dart';
import '../../../Core/Resources/text_style.dart';
import 'package:flutter/material.dart';

class RandomCard extends StatelessWidget {
  const RandomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Color(0x33000000),
              offset: Offset(0.0, 10),
              spreadRadius: 4,
            ),
          ],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Color(0xffc2c2c2)),
        ),
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            AppStrings.titleCard,
                            maxLines: 2,
                            style: AppTextStyle.semiBold16Black,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            AppStrings.descCard,
                            maxLines: 2,
                           style: AppTextStyle.normal13,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // ClipRRect(
              //   borderRadius: BorderRadius.circular(0),
              //   child: Image.asset(
              //     'assets/images/Slice_1.png',
              //     width: 20,
              //     height: 20,
              //     fit: BoxFit.contain,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
