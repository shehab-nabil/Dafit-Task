import 'package:dafit_task/core/error/failure.dart';
import 'package:dafit_task/features/diet_program/domain/models/program_model.dart';
import 'package:dafit_task/features/diet_program/domain/repositories/program_repo.dart';
import 'package:dafit_task/features/diet_program/domain/usecases/usecases.dart';
import 'package:dartz/dartz.dart';

class GetProgramUseCase implements BaseUseCases<MainDataModel, NoParams> {
  final ProgramRepository programRepository;

  GetProgramUseCase({required this.programRepository});

  @override
  Future<Either<Failure, MainDataModel?>> call(NoParams params) {
    return programRepository.getProgram();
  }
}
