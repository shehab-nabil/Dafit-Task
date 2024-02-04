import 'package:bloc/bloc.dart';
import 'package:dafit_task/core/error/failure.dart';
import 'package:dafit_task/features/diet_program/domain/models/program_model.dart';
import 'package:dafit_task/features/diet_program/domain/usecases/get_program.dart';
import 'package:dafit_task/features/diet_program/domain/usecases/usecases.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'program_state.dart';

class ProgramCubit extends Cubit<ProgramState> {
  ProgramCubit({required this.getProgramUseCase}) : super(ProgramInitial());
  final GetProgramUseCase getProgramUseCase;
  MainDataModel? mainDataModel;
  int mealElementLength = 0;
  Future<void> getProgram() async {
    emit(ProgramLoading());
    Either<Failure, MainDataModel?> response =
        await getProgramUseCase(NoParams());
    emit(response.fold((failure) => ProgramError(msg: failureMessage(failure)),
        (maindata) {
      mainDataModel = maindata;
      return ProgramLoaded(mainData: maindata!);
    }));
  }

  String getTotalCarb(MainDataModel mainDataModel) {
    double totalCarb = 0;
    double carbohydrates = 0;
    List<DietProgramMeal> mealList =
        mainDataModel.data!.program![0].dietProgramMeal!;
    for (int i = 0; i < mealList.length; i++) {
      List<DietProgramMealElement> mealElementList =
          mealList[i].dietProgramMealElement!;
      for (int j = 0; j < mealElementList.length; j++) {
        carbohydrates =
            double.parse(mealElementList[j].foodElement!.carbohydrates!);
        totalCarb = carbohydrates + totalCarb;
      }
    }
    return totalCarb.toString();
  }

  String getTotalCalories(MainDataModel mainDataModel) {
    double totalCalories = 0;
    double calories = 0;
    List<DietProgramMeal> mealList =
        mainDataModel.data!.program![0].dietProgramMeal!;
    for (int i = 0; i < mealList.length; i++) {
      List<DietProgramMealElement> mealElementList =
          mealList[i].dietProgramMealElement!;
      for (int j = 0; j < mealElementList.length; j++) {
        calories = double.parse(mealElementList[j].foodElement!.calories!);
        totalCalories = calories + totalCalories;
      }
    }
    return totalCalories.toString();
  }

  String getTotalProtein(MainDataModel mainDataModel) {
    double totalProtein = 0;
    double protein = 0;
    List<DietProgramMeal> mealList =
        mainDataModel.data!.program![0].dietProgramMeal!;
    for (int i = 0; i < mealList.length; i++) {
      List<DietProgramMealElement> mealElementList =
          mealList[i].dietProgramMealElement!;
      for (int j = 0; j < mealElementList.length; j++) {
        protein = double.parse(mealElementList[j].foodElement!.protein!);
        totalProtein = protein + totalProtein;
      }
    }
    return totalProtein.toString();
  }

  String failureMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server Failure';
      default:
        return 'unexpected Failure';
    }
  }
}
