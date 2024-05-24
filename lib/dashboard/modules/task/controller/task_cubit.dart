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

 // Method to create a new task and associate it with the user
  Future<void> createTask(String name, String desc, int times, int availableTimes, Uint8List image, int userId) async {
    try {
      // Insert task data into the database
      await repo.insertTask(name, desc, times, availableTimes, image);

      // Emit success state
      emit(TaskCreationSuccess());
    } catch (e) {
      // Emit error state if task creation fails
      emit(TaskCreationError(errorMessage: 'Failed to create task: $e'));
    }
  }
}
