import 'package:dafit_task/core/utils/app_colors.dart';
import 'package:dafit_task/core/utils/app_size.dart';
import 'package:dafit_task/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class CustomDeitContainer extends StatelessWidget {
  const CustomDeitContainer(
      {super.key,
      required this.carbohydrates,
      required this.calories,
      required this.protein});
  final String carbohydrates, calories, protein;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.s90,
      margin: const EdgeInsets.all(AppSize.s20),
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.grey),
          borderRadius: BorderRadius.circular(AppSize.s16)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${carbohydrates}g',
              textDirection: TextDirection.rtl,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: AppSize.s20,
                  color: AppColors.gold),
            ),
            const Text(
              AppStrings.carb,
              textDirection: TextDirection.rtl,
              style:
                  TextStyle(fontWeight: FontWeight.w700, fontSize: AppSize.s20),
            ),
          ],
        ),
        VerticalDivider(
          color: AppColors.grey,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${calories}g',
              textDirection: TextDirection.rtl,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: AppSize.s20,
                  color: AppColors.gold),
            ),
            const Text(
              AppStrings.calories,
              textDirection: TextDirection.rtl,
              style:
                  TextStyle(fontWeight: FontWeight.w700, fontSize: AppSize.s20),
            ),
          ],
        ),
        VerticalDivider(
          color: AppColors.grey,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${protein}g',
              textDirection: TextDirection.rtl,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: AppSize.s20,
                  color: AppColors.gold),
            ),
            const Text(
              AppStrings.protein,
              textDirection: TextDirection.rtl,
              style:
                  TextStyle(fontWeight: FontWeight.w700, fontSize: AppSize.s20),
            ),
          ],
        ),
      ]),
    );
  }
}
