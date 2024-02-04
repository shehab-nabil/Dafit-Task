import 'package:dafit_task/core/error/failure.dart';
import 'package:dafit_task/features/diet_program/domain/models/program_model.dart';
import 'package:dartz/dartz.dart';

abstract class ProgramRepository {
  Future<Either<Failure, MainDataModel>> getProgram();
}
