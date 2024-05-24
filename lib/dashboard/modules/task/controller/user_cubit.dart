import 'package:bloc/bloc.dart';
import 'package:commerce_project/dashboard/modules/task/model/entity_model/user_model.dart';
import 'package:commerce_project/dashboard/modules/task/model/repo/database_repo.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  static UserCubit instance = UserCubit();

  UserCubit() : super(UserStateLoading()) {
    init();
  }

  UserModel? user;
  DatabaseRepo repo = DatabaseRepo();

  Future<void> init() async {
    emit(UserStateLoading());
    try {
      // Fetch user data (if available) and emit appropriate state
      user = await repo.fetchUserByEmail('example@example.com');
      if (user != null) {
        emit(UserStateLoaded(user: user!));
      } else {
        emit(UserStateEmpty());
      }
    } catch (e) {
      emit(UserStateError(errorMessage: 'Failed to fetch user data: $e'));
    }
  }

  // Method to insert user data
  Future<void> insertUser(String fname, String lname, String email, String password) async {
    emit(UserStateLoading());
    try {
      await repo.insertUserData(fname, lname, email, password);
      user = UserModel(fname: fname, lname: lname, email: email, password: password);
      emit(UserStateLoaded(user: user!));
    } catch (e) {
      emit(UserStateError(errorMessage: 'Failed to insert user data: $e'));
    }
  }

  // Method to fetch user data
  Future<void> fetchUserByEmail(String email) async {
    emit(UserStateLoading());
    try {
      user = await repo.fetchUserByEmail(email);
      if (user != null) {
        emit(UserStateLoaded(user: user!));
      } else {
        emit(UserStateEmpty());
      }
    } catch (e) {
      emit(UserStateError(errorMessage: 'Failed to fetch user data: $e'));
    }
  }
}
