import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_admin_dashboard/project_shared/network/dio.dart';
import 'package:super_admin_dashboard/super_admin_dashboard/admins/admins_cubit/states.dart';
import '../admins_model.dart';


class AdminsCubit extends Cubit<AdminsStates> {
  AdminsCubit() : super(AdminsInitialState());

  static AdminsCubit get(context) => BlocProvider.of(context);

  AdminsModel adminsModel = AdminsModel();

  void getAdmins() {
    print('***************');
    try {
      emit(AdminsLoadingState());
      dioHelper
          .getData(
        url: 'api/admin/get',
      )
          .then((value) async {
        if (value != null) {
          adminsModel = AdminsModel.fromJson(value);
          emit(AdminsSuccessState());
        }
        print(value.toString());
      }).catchError((error) {
        emit(AdminsErrorState());
        print(error.toString());
      });
    } catch (e) {
      emit(AdminsErrorState());
      print(e);
    }
  }
}
