import 'package:flutter/material.dart';

extension PaddingExtension on num {
  EdgeInsetsGeometry get allP => EdgeInsets.all(toDouble());
  EdgeInsetsGeometry get onlyLeftP => EdgeInsets.only(left: toDouble());
  EdgeInsetsGeometry get onlyRightP => EdgeInsets.only(right: toDouble());
  EdgeInsetsGeometry get onlyTopP => EdgeInsets.only(top: toDouble());
  EdgeInsetsGeometry get onlyBottomP => EdgeInsets.only(bottom: toDouble());
  EdgeInsetsGeometry get horizontalP => EdgeInsets.symmetric(horizontal: toDouble());
  EdgeInsetsGeometry get verticalP => EdgeInsets.symmetric(vertical: toDouble());
}

extension PaddingExtensio on List {
  EdgeInsetsGeometry get horizontalAndVerticalP =>
      EdgeInsets.symmetric(horizontal: this[0].toDouble(), vertical: this[1].toDouble());
  EdgeInsetsGeometry get paddingLTRB =>
      EdgeInsets.fromLTRB(this[0].toDouble(), this[1].toDouble(), this[2].toDouble(), this[3].toDouble());
}
