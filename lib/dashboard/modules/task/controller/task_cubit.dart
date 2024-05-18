import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:commerce_project/dashboard/modules/task/model/entity_model/task_model.dart';
import 'package:commerce_project/dashboard/modules/task/model/repo/database_repo.dart';
import 'package:meta/meta.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  static TaskCubit instance = TaskCubit();

  TaskCubit() : super(TaskStateLoading()) {
    init();
  }

  List<TaskModel> tasks = [];

  DatabaseRepo repo = DatabaseRepo();

  Future<void> init() async {
    emit(TaskStateLoading());
    await repo.initDB();
    tasks = await repo.fetchTasks();
    if (tasks.isEmpty) {
      emit(TaskStateEmpty());
    } else {
      emit(TaskStateLoaded());
    }
  }

  Future<void> addItemToDone(int id, int value) async {
  await repo.updateDone(value, id);
  await init();
}

Future<void> addItemToMissed(int id, int value) async {
  await repo.updateMissed(value, id);
  await init();
}
Future<void> deleteTask(int id) async {
  await repo.deleteTask(id);
  await init(); // Refresh task list
}


}
