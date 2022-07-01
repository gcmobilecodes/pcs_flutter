import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSuffixIcon extends StatelessWidget {
  CustomSuffixIcon({
    required this.svgIcon,
    required this.size,
  });

  final String svgIcon;
  final int size;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        0,
        0,
        10,
        0,
      ),
      child: SvgPicture.asset(
        svgIcon,
        height: size.toDouble(),
      ),
    );
  }
}

class CustomSuffixIconCenter extends StatelessWidget {
  CustomSuffixIconCenter({
    required this.svgIcon,
    required this.size,
  });

  final String svgIcon;
  final int size;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        0,
        0,
        0,
        0,
      ),
      child: SvgPicture.asset(
        svgIcon,
        height: size.toDouble(),
      ),
    );
  }
}
