import 'package:flutter/material.dart';
import 'package:tetrazolium/app/constants.dart';

class StaggerAnimation extends StatelessWidget {
  final AnimationController controller;

  StaggerAnimation({Key? key, required this.controller})
      : buttopnSqueeze = Tween(begin: 320.0, end: 60.0).animate(CurvedAnimation(
            parent: controller, curve: const Interval(0.0, 0.150))),
        buttopnZoomOut = Tween(begin: 60.0, end: 1000.0).animate(
            CurvedAnimation(
                parent: controller,
                curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn))),
        super(key: key);

  final Animation<double> buttopnSqueeze;
  final Animation<double> buttopnZoomOut;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: _buildAnimation,
    );
  }

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: InkWell(
        onTap: () {
          controller.forward();
        },
        child: Hero(
            tag: "fade",
            child: buttopnZoomOut.value <= 60
                ? Container(
                    width: buttopnSqueeze.value,
                    height: 60,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        // color: Theme.of(context).buttonColor,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: _buidInside(context),
                  )
                : Container(
                    width: buttopnZoomOut.value,
                    height: buttopnZoomOut.value,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: buttopnZoomOut.value < 500
                            ? BoxShape.circle
                            : BoxShape.rectangle),
                  )),
      ),
    );
  }

  _buidInside(BuildContext context) {
    if (buttopnSqueeze.value > 75) {
      return Text(
        "Entrar",
        style: Theme.of(context)
            .primaryTextTheme
            .subtitle1
            ?.copyWith(color: const Color(COLOR_SECONDARY)),
      );
    } else {
      return const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        strokeWidth: 1.0,
      );
    }
  }
}
