
import 'package:flutter/material.dart';

import '../main.dart';

class AnimatedThemeChangerScaffold extends StatefulWidget {

  final AppBar? appBar;
  final Widget? body;
  final FloatingActionButton? floatingActionButton;

  const AnimatedThemeChangerScaffold({
    super.key,
    this.appBar,
    this.body,
    this.floatingActionButton,
  });

  @override
  State<AnimatedThemeChangerScaffold> createState() => _AnimatedThemeChangerScaffoldState();
}

class _AnimatedThemeChangerScaffoldState extends State<AnimatedThemeChangerScaffold> {

  final Offset _pointerOffset = Offset.zero;

  AnimationController? _animationController;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();

    initAnimation();
    // listen for isDarkMode changes
    isDarkMode.addListener(() {
      if (isDarkMode.value) {
        _animationController?.forward();
      } else {
        _animationController?.reverse();
      }
    });
  }

  initAnimation() {
    _animationController = AnimationController(
      vsync: Navigator.of(context),
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_animationController!);

    _animationController?.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // layer 1
        Theme(
          data: darkTheme,
          child: Scaffold(
            appBar: widget.appBar,
            body: widget.body ?? const SizedBox.shrink(),
            floatingActionButton: widget.floatingActionButton,
          ),
        ),
        // layer 2
        ClipPath(
          clipper: MyClipper(radius: 2000 * (_animation?.value ?? 1), offset: _pointerOffset),
          child: Theme(
            data: lightTheme,
            child: Scaffold(
              appBar: widget.appBar,
              body: widget.body ?? const SizedBox.shrink(),
              floatingActionButton: widget.floatingActionButton,
            ),
          ),
        ),
      ],
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  final Offset offset;
  final double radius;

  MyClipper({required this.offset, required this.radius});

  @override
  Path getClip(Size size) {
    // Create a circular clipping path
    Path path = Path()
      ..addOval(Rect.fromCircle(center: offset, radius: radius))
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height))
      ..fillType = PathFillType.evenOdd;

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}