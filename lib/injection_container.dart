import 'package:dafit_task/features/diet_program/data/datasources/response.dart';
import 'package:dafit_task/features/diet_program/data/repositories/program_repo_impl.dart';
import 'package:dafit_task/features/diet_program/domain/repositories/program_repo.dart';
import 'package:dafit_task/features/diet_program/domain/usecases/get_program.dart';
import 'package:dafit_task/features/diet_program/presentation/cubit/program_cubit.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;
Future<void> initSL() async {
//Bloc
  sl.registerFactory(() => ProgramCubit(getProgramUseCase: sl()));

//Use Cases
  sl.registerLazySingleton<GetProgramUseCase>(
      () => GetProgramUseCase(programRepository: sl()));

//Repository
  sl.registerLazySingleton<ProgramRepository>(
      () => ProgramRepositoryImpl(programRemoteDataSource: sl()));

//Data Source
  sl.registerLazySingleton<ProgramRemoteDataSource>(
      () => ProgramRemoteDataSourceImpl());
}
