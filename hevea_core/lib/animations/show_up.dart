import 'dart:async';
import 'package:flutter/material.dart';

class ShowUp extends StatefulWidget {
  final Widget? child;
  final int delay;
  final int duration;
  final bool isVertical;

  const ShowUp({Key? key, this.delay = 0, this.child, this.duration = 600, this.isVertical = true}) : super(key: key);

  @override
  _ShowUpState createState() => _ShowUpState();
}

class _ShowUpState extends State<ShowUp> with TickerProviderStateMixin {
  AnimationController? _animController;
  Animation<Offset>? _animOffset;
  bool _animControllerDipsos = false;
  @override
  void initState() {
    super.initState();

    _animController = AnimationController(vsync: this, duration: Duration(milliseconds: widget.duration));
    final curve = CurvedAnimation(curve: Curves.decelerate, parent: _animController!);
    _animOffset =
        Tween<Offset>(begin: Offset(widget.isVertical ? 0.0 : 0.35, widget.isVertical ? 0.35 : 0), end: Offset.zero)
            .animate(curve);

    if (widget.delay == 0) {
      _animController?.forward();
    } else {
      Timer(Duration(milliseconds: widget.delay), () {
        _animControllerDipsos == false ? _animController?.forward() : null;
      });
    }
  }

  @override
  void dispose() {
    _animControllerDipsos = true;
    _animController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      child: SlideTransition(
        position: _animOffset!,
        child: widget.child,
      ),
      opacity: _animController!,
    );
  }
}
