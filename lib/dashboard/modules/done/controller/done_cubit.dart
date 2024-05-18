import 'package:bloc/bloc.dart';
import 'package:commerce_project/dashboard/modules/task/controller/task_cubit.dart';
import 'package:commerce_project/dashboard/modules/task/model/entity_model/task_model.dart';
import 'package:commerce_project/dashboard/modules/task/model/repo/database_repo.dart';
import 'package:meta/meta.dart';

part 'done_state.dart';

class DoneCubit extends Cubit<DoneState> {
  DoneCubit() : super(DoneStateLoading()) {
    init();
  }

  List<TaskModel> tasks = [];

  DatabaseRepo repo = DatabaseRepo();

  Future<void> init() async {
    emit(DoneStateLoading());
    await repo.initDB();

    tasks = await repo.fetchDoneTasks();
    if (tasks.isEmpty) {
      emit(DoneStateEmpty());
    } else {
      emit(DoneStateLoaded());
    }
  }

  Future<void> addItemToDone(int id, int value) async {
    await repo.updateDone(value, id);
    await init();
    await TaskCubit.instance.init();
    emit(DoneStateLoaded());
  }
  Future<void> deleteTask(int id) async {
  await repo.deleteTask(id);
  await init(); // Refresh task list
}


  // void addItemToSuspended(int id) {
  //   repo.updateSuspended(1, id);
  //   emit(DoneStateLoaded());
  // }
}
