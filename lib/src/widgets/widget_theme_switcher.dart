
import 'package:flutter/material.dart';

class AnimatedThemeChangerScaffold extends StatefulWidget {

  final AppBar? appBar;
  final Widget? body;
  final FloatingActionButton? floatingActionButton;
  final ValueNotifier<bool> isDarkMode;

  const AnimatedThemeChangerScaffold({
    super.key,
    this.appBar,
    this.body,
    this.floatingActionButton,
    required this.isDarkMode,
  });

  @override
  State<AnimatedThemeChangerScaffold> createState() => _AnimatedThemeChangerScaffoldState();
}

class _AnimatedThemeChangerScaffoldState extends State<AnimatedThemeChangerScaffold> {

  final Offset _pointerOffset = Offset.zero;

  AnimationController? _animationController;
  final ValueNotifier<Animation<double>> _animation = ValueNotifier<Animation<double>>(const AlwaysStoppedAnimation<double>(0));

  @override
  void initState() {
    super.initState();

    initAnimation();
    // listen for isDarkMode changes
    widget.isDarkMode.addListener(() {
      if (widget.isDarkMode.value) {
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
    _animation.value = Tween<double>(
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
        if (widget.isDarkMode.value || isAnimating())
          Theme(
          data: ThemeData.light(),
          child: Scaffold(
            appBar: widget.appBar,
            body: widget.body ?? const SizedBox.shrink(),
            floatingActionButton: widget.floatingActionButton,
          ),
        ),
        // layer 2
        if (!widget.isDarkMode.value || isAnimating())
        ClipPath(
          clipper: MyClipper(radius: 2000 * (_animation.value.value), offset: _pointerOffset),
          child: Theme(
            data: ThemeData.dark(),
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

  bool isAnimating() {
    return _animationController?.isAnimating ?? false;
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