import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_admin_dashboard/project_shared/network/dio.dart';
import 'package:super_admin_dashboard/super_admin_dashboard/users/users_cubit/states.dart';

import '../users_model.dart';



class UsersCubit extends Cubit<UsersStates> {
  UsersCubit() : super(UsersInitialState());

  static UsersCubit get(context) => BlocProvider.of(context);

  UsersModel usersModel = UsersModel();

  void getUsers() {
    print('***************');
    try {
      emit(UsersLoadingState());
      dioHelper
          .getData(
        url: 'api/user/get',
      )
          .then((value) async {
        if (value != null) {
          usersModel = UsersModel.fromJson(value);
          emit(UsersSuccessState());
        }
        //print(value.toString());
      }).catchError((error) {
        emit(UsersErrorState());
        print(error.toString());
      });
    } catch (e) {
      emit(UsersErrorState());
      print(e);
    }
  }
}
