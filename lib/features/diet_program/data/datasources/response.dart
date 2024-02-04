import 'package:dafit_task/features/diet_program/domain/models/program_model.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/utils/api.dart';

abstract class ProgramRemoteDataSource {
  Future<MainDataModel> getProgram();
}

class ProgramRemoteDataSourceImpl implements ProgramRemoteDataSource {
  @override
  Future<MainDataModel> getProgram() async {
    final response = await Dio().get(Api.apiUrl);
    if (response.statusCode == 200) {
      return MainDataModel.fromJson(response.data);
    } else {
      throw const ServerException();
    }
  }
}
