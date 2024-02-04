import 'package:dafit_task/core/utils/app_colors.dart';
import 'package:dafit_task/core/utils/app_size.dart';
import 'package:dafit_task/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class CustomMealElementContainer extends StatelessWidget {
  const CustomMealElementContainer(
      {super.key, required this.elementName, required this.elementQuantity});
  final String elementName, elementQuantity;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.s60,
      margin: const EdgeInsets.all(AppSize.s8),
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.all(AppSize.s8),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.gold),
          borderRadius: BorderRadius.circular(AppSize.s16)),
      child: Row(
        children: [
          const Icon(Icons.restaurant),
          const Spacer(
            flex: 1,
          ),
          Text(
            elementName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: AppSize.s20,
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Text(
            ' ${elementQuantity}x  ${AppStrings.pice}',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: AppSize.s20,
                color: AppColors.grey),
          ),
          const Spacer(
            flex: 15,
          ),
          const Icon(Icons.arrow_forward_ios_rounded),
        ],
      ),
    );
  }
}
