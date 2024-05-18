import 'package:bloc/bloc.dart';
import 'package:commerce_project/dashboard/modules/task/controller/task_cubit.dart';
import 'package:commerce_project/dashboard/modules/task/model/entity_model/task_model.dart';
import 'package:commerce_project/dashboard/modules/task/model/repo/database_repo.dart';
import 'package:meta/meta.dart';

part 'missed_state.dart';

class MissedCubit extends Cubit<MissedState> {
  MissedCubit() : super(MissedStateLoading()) {
    init();
  }

  List<TaskModel> tasks = [];

  DatabaseRepo repo = DatabaseRepo();

  Future<void> init() async {
    emit(MissedStateLoading());
    await repo.initDB();

    tasks = await repo.fetchMissedTasks();
    if (tasks.isEmpty) {
      emit(MissedStateEmpty());
    } else {
      emit(MissedStateLoaded());
    }
  }

  Future<void> addItemToMissed(int id, int value) async {
    await repo.updateDone(value, id);
    await init();
    await TaskCubit.instance.init();
    emit(MissedStateLoaded());
  }
  Future<void> deleteTask(int id) async {
  await repo.deleteTask(id);
  await init(); // Refresh task list
}
}
