// import 'package:meta/meta.dart';
part of 'task_cubit.dart';

@immutable
abstract class TaskState {}

class TaskStateLoading extends TaskState {}

class TaskStateLoaded extends TaskState {}

class TaskStateEmpty extends TaskState {}

class TaskCreationSuccess extends TaskState {}

class TaskCreationError extends TaskState {
  final String errorMessage;

  TaskCreationError({required this.errorMessage});
}
