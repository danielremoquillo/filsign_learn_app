import 'package:flutter/material.dart';

class RoundedInnerLinearProgressIndicator extends StatefulWidget {
  final double value;
  final double height;
  final Color backgroundColor;
  final Color valueColor;
  final BorderRadius borderRadius;

  const RoundedInnerLinearProgressIndicator({
    Key? key,
    required this.value,
    this.height = 10.0,
    this.backgroundColor = Colors.black,
    this.valueColor = Colors.blue,
    this.borderRadius = const BorderRadius.all(Radius.circular(10.0)),
  }) : super(key: key);

  @override
  _RoundedInnerLinearProgressIndicatorState createState() =>
      _RoundedInnerLinearProgressIndicatorState();
}

class _RoundedInnerLinearProgressIndicatorState
    extends State<RoundedInnerLinearProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: widget.value,
    ).animate(_animationController);
    _animationController.forward();
  }

  @override
  void didUpdateWidget(RoundedInnerLinearProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _animation = Tween<double>(
        begin: oldWidget.value,
        end: widget.value,
      ).animate(_animationController);
      _animationController.reset();
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: widget.borderRadius,
        border: Border.all(
          color: widget.backgroundColor,
          width: 2.5,
        ),
      ),
      child: ClipRRect(
        borderRadius: widget.borderRadius,
        child: AnimatedBuilder(
          animation: _animation,
          builder: (BuildContext context, Widget? child) {
            return LinearProgressIndicator(
              backgroundColor: Colors.transparent,
              value: _animation.value,
              valueColor: AlwaysStoppedAnimation(widget.valueColor),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
