import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:super_admin_dashboard/project_shared/network/dio.dart';
import 'package:super_admin_dashboard/super_admin_dashboard/home_screen2/home_screen_cubit/states.dart';
import '../../../project_shared/network/shared_preferences.dart';
import '../home_screen_model.dart';



class HomeScreenCubit extends Cubit<HomeScreenStates> {
  HomeScreenCubit() : super(HomeScreenInitialState());

  static HomeScreenCubit get(context) => BlocProvider.of(context);

  AdminsCountModel adminCountModel = AdminsCountModel();
  UsersCountModel userCountModel = UsersCountModel();
  OrderCountModel orderCountModel = OrderCountModel();
  BestSellingModel bestSellingModel = BestSellingModel();

  void getAdminCount() {
    try {
      emit(AdminCountLoadingState());
      dioHelper
          .getData(
        url: 'api/admin/adminsCount',
      )
          .then((value) async {
        if (value != null) {
          adminCountModel = AdminsCountModel.fromJson(value);
          emit(AdminCountSuccessState());
        }
      }).catchError((error) {
        emit(AdminCountErrorState());
        print(error.toString());
      });
    } catch (e) {
      emit(AdminCountErrorState());
      print(e);
    }
  }

  void getUsersCount() {
    try {
      emit(UserCountLoadingState());
      dioHelper
          .getData(
        url: 'api/user/usersCount',
      )
          .then((value) async {
        if (value != null) {
          userCountModel = UsersCountModel.fromJson(value);
          emit(UserCountSuccessState());
        }
      }).catchError((error) {
        emit(UserCountErrorState());
        print(error.toString());
      });
    } catch (e) {
      emit(UserCountErrorState());
      print(e);
    }
  }

  void getOrderCount() {
    try {
      emit(OrderCountLoadingState());
      dioHelper
          .getData(
        url: 'api/user/ordersCount?=',
      )
          .then((value) async {
        if (value != null) {
          orderCountModel = OrderCountModel.fromJson(value);
          emit(OrderCountSuccessState());
        }
      }).catchError((error) {
        emit(OrderCountErrorState());
        print(error.toString());
      });
    } catch (e) {
      emit(OrderCountErrorState());
      print(e);
    }
  }

  void getBestSelling() {
    try {
      emit(BestSellingLoadingState());
      dioHelper
          .getData(
        url: 'api/product/get_highest_sellcount',
      )
          .then((value) async {
        if (value != null) {
          bestSellingModel = BestSellingModel.fromJson(value);
          emit(BestSellingSuccessState());
        }
        print(value.toString());
      }).catchError((error) {
        emit(BestSellingErrorState());
        print(error.toString());
      });
    } catch (e) {
      emit(BestSellingErrorState());
      print(e);
    }
  }

}
