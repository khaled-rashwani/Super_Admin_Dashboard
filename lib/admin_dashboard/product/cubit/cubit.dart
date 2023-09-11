import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_admin_dashboard/admin_dashboard/product/cubit/states.dart';
import 'package:super_admin_dashboard/project_shared/network/dio.dart';

import '../../../project_shared/network/shared_preferences.dart';
import '../model.dart';



class XAdminProductCubit extends Cubit<XAdminProductStates> {
  XAdminProductCubit() : super(XAdminProductInitialState());

  static XAdminProductCubit get(context) => BlocProvider.of(context);

  XAdminProductModel xadminProductModel = XAdminProductModel();
  var id = CacheHelper.getData(key: 'id')??0;

  void getXAdminProduct() {
    print("XXXXXXXXXXXXXXXXXX");
    print(id.toString());
    print("XXXXXXXXXXXXXXXXXX");
    try {
      emit(XAdminProductLoadingState());
      dioHelper
          .getData(
        url: 'api/product/get_admin_products/$id',
      )
          .then((value) async {
        if (value != null) {
          xadminProductModel = XAdminProductModel.fromJson(value);
          emit(XAdminProductSuccessState());
        }
        print(value.toString());
      }).catchError((error) {
        emit(XAdminProductErrorState());
        print(error.toString());
      });
    } catch (e) {
      emit(XAdminProductErrorState());
      print(e);
    }
  }

// void changeIndex(var id){
//   index = id;
//   getAdminProduct();
// }

}
