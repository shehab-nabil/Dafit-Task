import 'package:dafit_task/core/utils/app_colors.dart';
import 'package:dafit_task/core/utils/app_size.dart';
import 'package:dafit_task/core/utils/app_strings.dart';
import 'package:dafit_task/features/diet_program/domain/models/program_model.dart';
import 'package:dafit_task/features/diet_program/presentation/widgets/custom_diet_container.dart';
import 'package:dafit_task/features/diet_program/presentation/widgets/custom_listtile.dart';
import 'package:flutter/material.dart';

class FoodElementDetailsScreen extends StatelessWidget {
  const FoodElementDetailsScreen(
      {super.key, required this.dietProgramMealElement});
  final DietProgramMealElement dietProgramMealElement;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: AppSize.s10,
        centerTitle: true,
        title: Text(
          ' تفاصيل ${dietProgramMealElement.foodElement!.name}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: AppSize.s30,
          ),
        ),
      ),
      body: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.all(AppSize.s10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomDeitContainer(
                  carbohydrates:
                      dietProgramMealElement.foodElement!.carbohydrates!,
                  calories: dietProgramMealElement.foodElement!.calories!,
                  protein: dietProgramMealElement.foodElement!.protein!),
              AppListTile(
                  title: AppStrings.protein,
                  trailing: dietProgramMealElement.foodElement!.protein!),
              AppListTile(
                  title: AppStrings.calories,
                  trailing: dietProgramMealElement.foodElement!.calories!),
              AppListTile(
                  title: AppStrings.carb,
                  trailing: dietProgramMealElement.foodElement!.carbohydrates!),
              AppListTile(
                  title: AppStrings.fat,
                  trailing: dietProgramMealElement.foodElement!.fat!),
              AppListTile(
                  title: AppStrings.fiber,
                  trailing: dietProgramMealElement.foodElement!.fiber!),
              AppListTile(
                  title: AppStrings.sugar,
                  trailing: dietProgramMealElement.foodElement!.sugar!),
              Divider(
                height: AppSize.s50,
                thickness: 1.5,
                color: AppColors.black,
                endIndent: AppSize.s20,
                indent: AppSize.s20,
              ),
              Text(
                ' ${dietProgramMealElement.quantity} ${AppStrings.pice}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: AppSize.s30,
                    color: AppColors.grey),
              ),
              const SizedBox(
                height: AppSize.s10,
              ),
              Text(
                ' ${AppStrings.noNotes}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: AppSize.s30,
                    color: AppColors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
