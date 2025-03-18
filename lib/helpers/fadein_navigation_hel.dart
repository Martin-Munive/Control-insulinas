import 'package:flutter/material.dart';

enum AnimationType { normal, fadeIn }

class RouteTransition {
  final BuildContext context;
  final Widget child;
  final AnimationType animation;
  final Duration duration;
  final bool replacement;

  RouteTransition({
    required this.context,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    this.animation = AnimationType.normal,
    this.replacement = false,
  }) {
    switch (animation) {
      case AnimationType.normal:
        _normalTransitions();
        break;
      case AnimationType.fadeIn:
        _fadeInTransitions();
        break;
    }
  }

  void _pushPage(Route route) => Navigator.push(context, route);
  void _pushReplacementPage(Route route) =>
      Navigator.pushReplacement(context, route);

  void _normalTransitions() {
    final route = MaterialPageRoute(builder: (_) => child);
    (replacement) ? _pushReplacementPage(route) : _pushPage(route);
  }

  void _fadeInTransitions() {
    final route = PageRouteBuilder(
      pageBuilder: (_, __, ___) => child,
      transitionDuration: duration,
      transitionsBuilder: (_, animation, __, child) {
        return FadeTransition(
          child: child,
          opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOut)),
        );
      },
    );

    (replacement) ? _pushReplacementPage(route) : _pushPage(route);
  }
}
