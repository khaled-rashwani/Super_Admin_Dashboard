import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_admin_dashboard/project_shared/network/dio.dart';
import 'package:super_admin_dashboard/super_admin_dashboard/admin_products/cubit/states.dart';
import 'package:super_admin_dashboard/super_admin_dashboard/categories/categories_cubit/states.dart';
import 'package:super_admin_dashboard/super_admin_dashboard/categories/categories_model.dart';
import '../../../project_shared/network/shared_preferences.dart';
import '../model.dart';


class AdminProductCubit extends Cubit<AdminProductStates> {
  AdminProductCubit() : super(AdminProductInitialState());

  static AdminProductCubit get(context) => BlocProvider.of(context);

  AdminProductModel adminProductModel = AdminProductModel();

  void getAdminProduct(var index) {
    try {
      emit(AdminProductLoadingState());
      dioHelper
          .getData(
        url: 'api/product/get_admin_products/${index}',
      )
          .then((value) async {
        if (value != null) {
          adminProductModel = AdminProductModel.fromJson(value);
          emit(AdminProductSuccessState());
        }
        print(value.toString());
      }).catchError((error) {
        emit(AdminProductErrorState());
        print(error.toString());
      });
    } catch (e) {
      emit(AdminProductErrorState());
      print(e);
    }
  }

  // void changeIndex(var id){
  //   index = id;
  //   getAdminProduct();
  // }

}
