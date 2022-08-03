import 'package:flutter/material.dart';
import 'package:ubenwa/models/pet_model.dart';
import 'package:ubenwa/screens/home/home_base.dart';
import 'package:ubenwa/screens/pet_detail/pet_detail.dart';

class AppRoutes {
  // homepage
  static const String home = '/home';
  static const String detail = '/detail';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final argument = settings.arguments;
    switch (settings.name) {
      case home:
        return _getRoute(const HomeScreen());
      case detail:
        return _getRoute(PetDetailScreen(petModel: argument as PetModel?));
      default:
        return _getRoute(const HomeScreen());
    }
  }

  static Route<dynamic> _getRoute(Widget screenName) =>
      MaterialPageRoute(builder: (_) => screenName);
}
