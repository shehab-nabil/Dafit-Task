import 'package:dafit_task/core/utils/app_colors.dart';
import 'package:dafit_task/core/utils/app_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppListTile extends StatelessWidget {
  const AppListTile({super.key, required this.title, required this.trailing});
  final String title, trailing;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.s8),
      child: ListTile(
        dense: true,
        trailing: Text(
          trailing,
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: AppSize.s20,
              color: AppColors.grey),
        ),
        title: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: AppSize.s24,
              color: AppColors.black),
        ),
      ),
    );
  }
}
