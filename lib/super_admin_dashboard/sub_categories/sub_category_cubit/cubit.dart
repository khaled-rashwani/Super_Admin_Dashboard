import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_admin_dashboard/project_shared/network/dio.dart';
import 'package:super_admin_dashboard/super_admin_dashboard/admins/admins_cubit/states.dart';
import 'package:super_admin_dashboard/super_admin_dashboard/sub_categories/sub_category_cubit/states.dart';

import '../sub_category_model.dart';



class SubCategoryCubit extends Cubit<SubCategoryStates> {
  SubCategoryCubit() : super(SubCategoryInitialState());

  static SubCategoryCubit get(context) => BlocProvider.of(context);

  SubCategoryModel subCategoryModel = SubCategoryModel();
  var deleteCategoryId ;
  void getSubCategory() {
    print('***************');
    try {
      emit(SubCategoryLoadingState());
      dioHelper
          .getData(
        url: 'api/super_admin/getAllChildren',
      )
          .then((value) async {
        if (value != null) {
          subCategoryModel = SubCategoryModel.fromJson(value);
          emit(SubCategorySuccessState());
        }
        print(value.toString());
      }).catchError((error) {
        emit(SubCategoryErrorState());
        print(error.toString());
      });
    } catch (e) {
      emit(SubCategoryErrorState());
      print(e);
    }
  }

  void changeid(var id){
    deleteCategoryId = id;
    deleteCategories();
  }

  void deleteCategories() {
    try {
      emit(deleteSubCategoryLoadingState());
      dioHelper
          .deleteData(
        url: 'api/super_admin/delete_category/${deleteCategoryId}',
      )
          .then((value) async {
        if (value != null) {
          getSubCategory();
          emit(deleteSubCategorySuccessState());
        }
      }).catchError((error) {
        emit(deleteSubCategoryErrorState());
        print(error.toString());
      });
    } catch (e) {
      emit(deleteSubCategoryErrorState());
      print(e);
    }
  }
}
