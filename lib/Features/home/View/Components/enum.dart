import 'package:flutter/material.dart';

enum TypeCards {
  big(270.0, null ,EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),200),

  small(270, 100.0 ,EdgeInsetsDirectional.fromSTEB(16, 8, 0, 12),110);

  final double width;
  final double? height;

  final EdgeInsetsGeometry  padding;
    final double heightImage;
  const TypeCards(this.width, this.height, this.padding,this.heightImage);
}
