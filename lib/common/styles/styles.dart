import 'package:flutter/material.dart';

List<BoxShadow> getDefaultShadow() {
  return [
    BoxShadow(
      spreadRadius: 0,
      blurRadius: 15,
      offset: Offset(0, 0),
      color: Colors.blueGrey.withOpacity(0.6),
    )
  ];
}

List<BoxShadow> getShadowY10B16() {
  return [
    BoxShadow(
      spreadRadius: 0,
      blurRadius: 16,
      offset: Offset(0, 10),
      color: Colors.black.withOpacity(0.05),
    )
  ];
}
