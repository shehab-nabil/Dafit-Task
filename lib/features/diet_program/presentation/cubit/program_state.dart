part of 'program_cubit.dart';

abstract class ProgramState extends Equatable {
  const ProgramState();

  @override
  List<Object> get props => [];
}

class ProgramInitial extends ProgramState {}

class ProgramLoading extends ProgramState {}

class ProgramLoaded extends ProgramState {
  final MainDataModel mainData;

  const ProgramLoaded({required this.mainData});
  @override
  List<Object> get props => [mainData];
}

class ProgramError extends ProgramState {
  final String msg;

  const ProgramError({required this.msg});

  @override
  List<Object> get props => [msg];
}
