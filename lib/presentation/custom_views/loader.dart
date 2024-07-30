import 'package:flutter/material.dart';
import '../resources/theme.dart';

class BaseLoadingIndicator extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? color;

  const BaseLoadingIndicator({super.key, this.height, this.width, this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? double.infinity,
      width: width ?? double.infinity,
      child: const Center(
        child: CircularProgressIndicator(
          color: AppColors.charcoal2,
          backgroundColor: AppColors.charcoal,
        ),
      ),
    );
  }
}
