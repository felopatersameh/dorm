import 'package:flutter/material.dart';

enum AnimationType {
  bottomToTop,

  fadeOnly,

  rightToLeft,
}

class BuildAnimatedview extends StatefulWidget {
  final Widget child;
  final int index;
  final AnimationType animationType;

  const BuildAnimatedview({
    super.key,
    required this.child,
    required this.index,
    this.animationType = AnimationType.bottomToTop,
  });

  @override
  State<BuildAnimatedview> createState() => _BuildAnimatedviewState();
}

class _BuildAnimatedviewState extends State<BuildAnimatedview>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.animationType) {
      case AnimationType.bottomToTop:
        return _buildBottomToTopAnimation();
      case AnimationType.fadeOnly:
        return _buildFadeOnlyAnimation();
      case AnimationType.rightToLeft:
        return _buildRightToLeftAnimation();
    }
  }

  /// Bottom to top animation with fade
  Widget _buildBottomToTopAnimation() {
    return FadeTransition(
      opacity: _animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.2),
          end: Offset.zero,
        ).animate(_animation),
        child: AnimatedBuilder(
          animation: AlwaysStoppedAnimation(widget.index),
          builder: (context, child) {
            return TweenAnimationBuilder(
              tween: Tween<double>(begin: 1.0, end: 0.0),
              duration: Duration(milliseconds: 500 + (widget.index * 200)),
              builder: (context, value, child) {
                return Transform.translate(
                  offset: Offset(0, value * 100),
                  child: Opacity(opacity: 1 - value, child: widget.child),
                );
              },
              child: child,
            );
          },
        ),
      ),
    );
  }

  /// Fade only animation
  Widget _buildFadeOnlyAnimation() {
    return FadeTransition(
      opacity: _animation,
      child: AnimatedBuilder(
        animation: AlwaysStoppedAnimation(widget.index),
        builder: (context, child) {
          return TweenAnimationBuilder(
            tween: Tween<double>(begin: 1.0, end: 0.0),
            duration: Duration(milliseconds: 500 + (widget.index * 200)),
            builder: (context, value, child) {
              return Opacity(opacity: 1 - value, child: widget.child);
            },
            child: child,
          );
        },
      ),
    );
  }

  /// Right to left animation with fade
  Widget _buildRightToLeftAnimation() {
    return FadeTransition(
      opacity: _animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0.2, 0),
          end: Offset.zero,
        ).animate(_animation),
        child: AnimatedBuilder(
          animation: AlwaysStoppedAnimation(widget.index),
          builder: (context, child) {
            return TweenAnimationBuilder(
              tween: Tween<double>(begin: 1.0, end: 0.0),
              duration: Duration(milliseconds: 500 + (widget.index * 200)),
              builder: (context, value, child) {
                return Transform.translate(
                  offset: Offset(value * 100, 0),
                  child: Opacity(opacity: 1 - value, child: widget.child),
                );
              },
              child: child,
            );
          },
        ),
      ),
    );
  }
}
