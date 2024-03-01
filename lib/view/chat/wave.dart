import 'package:flutter/material.dart';

/// 波浪组件
class CircleExpanding extends StatefulWidget {
  final double size;
  final Color color;

  CircleExpanding({required this.size, required this.color});

  @override
  _CircleExpandingState createState() => _CircleExpandingState();
}

class _CircleExpandingState extends State<CircleExpanding>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: Duration(milliseconds: (widget.size + 500).toInt()), vsync: this);
    _animation = Tween<double>(begin: widget.size / 2, end: widget.size)
        .animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ))
      ..addListener(() {
        setState(() {});
      });

    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: widget.size,
      child: Center(
        child: Container(
          width: _animation.value,
          height: _animation.value,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.color,
          ),
        ),
      ),
    );
  }
}
