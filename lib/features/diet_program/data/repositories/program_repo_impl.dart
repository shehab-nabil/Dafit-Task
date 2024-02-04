import 'package:dafit_task/features/diet_program/data/datasources/response.dart';
import 'package:dafit_task/features/diet_program/domain/models/program_model.dart';
import 'package:dafit_task/features/diet_program/domain/repositories/program_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';

class ProgramRepositoryImpl implements ProgramRepository {
  final ProgramRemoteDataSource programRemoteDataSource;

  ProgramRepositoryImpl({required this.programRemoteDataSource});

  @override
  Future<Either<Failure, MainDataModel>> getProgram() async {
    try {
      final respose = await programRemoteDataSource.getProgram();
      return Right(respose);
    } on ServerException {
      print('error ');
      return left(ServerFailure());
    }
  }
}
