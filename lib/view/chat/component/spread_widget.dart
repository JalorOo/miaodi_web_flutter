import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpreadWidget extends StatefulWidget {
  SpreadWidget({
    required this.child,
    required this.radius,
    required this.maxRadius,
    this.cycles = 100,
    this.spreadColor = Colors.grey,
    this.duration = const Duration(milliseconds: 1000),
  });

  final Widget child;
  final double radius;
  final double maxRadius;
  final int cycles;
  final Color spreadColor;
  final Duration duration;

  @override
  _SpreadWidgetState createState() => _SpreadWidgetState();
}

class _SpreadWidgetState extends State<SpreadWidget>
    with TickerProviderStateMixin {
  List<Widget> children = [];
  List<AnimationController> controllers = [];

  @override
  void initState() {
    super.initState();
    children.add(
      ClipOval(
        child: SizedBox(
          width: widget.radius,
          height: widget.radius,
          child: widget.child,
        ),
      ),
    );
    start();
  }

  start() async {
    int i = 0;
    while (widget.cycles == null ? true : i < widget.cycles) {
      if (mounted) {
        setState(() {
          AnimationController _animationController;
          Animation<double> _animation;

          _animationController =
              AnimationController(vsync: this, duration: widget.duration);
          _animation = CurvedAnimation(
              parent: _animationController, curve: Curves.linear);

          _animationController.addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              children.removeAt(0);
              controllers.removeAt(0);
              _animationController.dispose();
            }
          });
          controllers.add(_animationController);
          _animationController.forward();

          widget.child != null
              ? children.insert(
                  children.length - 1,
                  AnimatedSpread(
                      animation: _animation,
                      radius: widget.radius,
                      maxRadius: widget.maxRadius,
                      color: widget.spreadColor))
              : children.add(AnimatedSpread(
                  animation: _animation,
                  radius: widget.radius,
                  maxRadius: widget.maxRadius,
                  color: widget.spreadColor,
                ));
        });
      }i++;
      await Future.delayed(
          Duration(milliseconds: 1000));
    }
  }

  @override
  void dispose() {
    controllers.forEach((c) {
      c.dispose();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: children,
      alignment: Alignment.center,
    );
  }
}

class AnimatedSpread extends AnimatedWidget {
  final Tween<double> _opacityTween = Tween(begin: 1, end: 0);
  final Tween<double> _radiusTween;
  final Color color;
  final Animation<double> animation;

  AnimatedSpread(
      {required this.animation,
      required double radius,
      required double maxRadius,
      required this.color})
      : _radiusTween = Tween(begin: radius, end: maxRadius),
        super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _radiusTween.evaluate(animation),
      height: _radiusTween.evaluate(animation),
      child: ClipOval(
        child: Opacity(
          opacity: _opacityTween.evaluate(animation),
          child: Container(
            color: color,
          ),
        ),
      ),
    );
  }
}
