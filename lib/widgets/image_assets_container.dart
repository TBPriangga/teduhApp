import 'package:flutter/material.dart';

class ImageAssetsContainer extends StatelessWidget {
  const ImageAssetsContainer({
    super.key,
    required this.width,
    this.height = 125,
    required this.coverUrl,
    this.padding,
    this.margin,
    this.borderRadius = 20,
    this.child,
  });

  final double width;
  final double height;
  final String coverUrl;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double borderRadius;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(coverUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
