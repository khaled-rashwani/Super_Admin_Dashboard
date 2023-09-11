import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_admin_dashboard/project_shared/network/dio.dart';
import 'package:super_admin_dashboard/super_admin_dashboard/categories/categories_cubit/states.dart';
import '../../../project_shared/network/shared_preferences.dart';
import '../categories_model.dart';


class SuperCategoryCubit extends Cubit<SuperCategoryStates> {
  SuperCategoryCubit() : super(SuperCategoryInitialState());

  static SuperCategoryCubit get(context) => BlocProvider.of(context);

  SuperCategoriesModel superCategoriesModel = SuperCategoriesModel();
 // var id = CacheHelper.getStringData(key: 'id').toString();
  var deleteCategoryId ;

  void getCategories() {

    try {
      emit(getCategoryLoadingState());
      dioHelper
          .getData(
        url: 'api/admin/get_all_categories_with_produts',
      )
          .then((value) async {
        if (value != null) {
          superCategoriesModel = SuperCategoriesModel.fromJson(value);
          emit(getCategorySuccessState());
        }
        print(value.toString());
      }).catchError((error) {
        emit(getCategoryErrorState());
        print(error.toString());
      });
    } catch (e) {
      emit(getCategoryErrorState());
      print(e);
    }
  }

  void changeid(var id){
    deleteCategoryId = id;
    deleteCategories();
  }

  void deleteCategories() {
    try {
      emit(deleteCategoryLoadingState());
      dioHelper
          .deleteData(
        url: 'api/super_admin/delete_category/${deleteCategoryId}',
      )
          .then((value) async {
        if (value != null) {
          getCategories();
          emit(deleteCategorySuccessState());
        }
      }).catchError((error) {
        emit(deleteCategoryErrorState());
        print(error.toString());
      });
    } catch (e) {
      emit(deleteCategoryErrorState());
      print(e);
    }
  }
}
