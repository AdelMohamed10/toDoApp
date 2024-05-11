import 'package:commerce_project/dashboard/modules/new_task/view/page/new_task_page.dart';
import 'package:commerce_project/dashboard/view/page/dashboard_page.dart';
import 'package:flutter/material.dart';

class MyRoute {
  static List<Route<dynamic>> initialRoutes = [
    MaterialPageRoute(builder: (_) => const DashboardPage()),
  ];

  static Route<dynamic> onNavigateByName(RouteSettings settings) {
    switch (settings.name) {
      case 'dashboard':
        return MaterialPageRoute(builder: (_) => const DashboardPage());
      case 'new_task':
        return MaterialPageRoute(builder: (_) => const NewTaskPage());
      default:
        return MaterialPageRoute(builder: (_) => const DashboardPage());
    }
  }
}