import 'package:dafit_task/core/utils/app_colors.dart';
import 'package:dafit_task/core/utils/app_size.dart';
import 'package:dafit_task/core/utils/app_strings.dart';
import 'package:dafit_task/features/diet_program/domain/models/program_model.dart';
import 'package:dafit_task/features/diet_program/presentation/cubit/program_cubit.dart';
import 'package:dafit_task/features/diet_program/presentation/pages/food_element_Details_Screen.dart';
import 'package:dafit_task/features/diet_program/presentation/widgets/custom_diet_container.dart';
import 'package:dafit_task/features/diet_program/presentation/widgets/custom_meal_element_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _getProgram() => BlocProvider.of<ProgramCubit>(context).getProgram();
  @override
  void initState() {
    super.initState();
    _getProgram();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProgramCubit, ProgramState>(
      builder: (context, state) {
        if (state is ProgramLoading) {
          return Scaffold(
              body: Center(
                  child: CircularProgressIndicator(
            color: AppColors.gold,
          )));
        } else if (state is ProgramLoaded) {
          ProgramModel program = state.mainData.data!.program![0];
          return Scaffold(
            appBar: AppBar(
              titleSpacing: AppSize.s10,
              centerTitle: true,
              title: Text(
                ' ${AppStrings.program} ${program.programName!}',
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
                    const SizedBox(height: AppSize.s30),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppSize.s24),
                      child: Text(
                        AppStrings.programCalculation,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: AppSize.s24),
                      ),
                    ),
                    CustomDeitContainer(
                        carbohydrates: BlocProvider.of<ProgramCubit>(context)
                            .getTotalCarb(state.mainData),
                        calories: BlocProvider.of<ProgramCubit>(context)
                            .getTotalCalories(state.mainData),
                        protein: BlocProvider.of<ProgramCubit>(context)
                            .getTotalProtein(state.mainData)),
                    const Divider(
                      height: AppSize.s50,
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: AppSize.s30),
                        child: ListView.builder(
                            itemCount: program.dietProgramMeal!.length,
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    program.dietProgramMeal![index].mealName!,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: AppSize.s24,
                                    ),
                                  ),
                                  ListView.builder(
                                      shrinkWrap: true,
                                      physics: const ClampingScrollPhysics(),
                                      itemCount: program.dietProgramMeal![index]
                                          .dietProgramMealElement!.length,
                                      itemBuilder: (context, index2) {
                                        DietProgramMealElement
                                            dietProgramMealElement = program
                                                    .dietProgramMeal![index]
                                                    .dietProgramMealElement![
                                                index2];
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            InkWell(
                                              onTap: () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          FoodElementDetailsScreen(
                                                              dietProgramMealElement:
                                                                  dietProgramMealElement))),
                                              child: CustomMealElementContainer(
                                                elementName: program
                                                    .dietProgramMeal![index]
                                                    .dietProgramMealElement![
                                                        index2]
                                                    .foodElement!
                                                    .name!,
                                                elementQuantity: program
                                                    .dietProgramMeal![index]
                                                    .dietProgramMealElement![
                                                        index2]
                                                    .quantity!,
                                              ),
                                            ),
                                          ],
                                        );
                                      }),
                                ],
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
            body: Center(
              child: Text(AppStrings.error,
                  style:
                      TextStyle(color: AppColors.red, fontSize: AppSize.s20)),
            ),
          );
        }
      },
    );
  }
}
