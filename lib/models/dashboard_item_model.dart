import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class DashboardItemModel {
  final IconData icon;
  final String label;
  final PageRouteInfo<dynamic> route;

  DashboardItemModel({
    required this.icon,
    required this.label,
    required this.route,
  });
}
