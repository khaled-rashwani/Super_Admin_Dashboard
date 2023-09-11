import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_admin_dashboard/admin_dashboard/admin_category/cubit/states.dart';
import 'package:super_admin_dashboard/project_shared/network/dio.dart';
import '../../../project_shared/network/shared_preferences.dart';
import '../../category_model.dart';

class CategoryCubit extends Cubit<CategoryStates> {
  CategoryCubit() : super(CategoryInitialState());

  static CategoryCubit get(context) => BlocProvider.of(context);

  AdminCategory categoriesModel = AdminCategory();
  var id = CacheHelper.getStringData(key: 'id').toString();

  void getCategories() {
    print('***************');
    print(id);
    try {
      emit(GetCategoryLoadingState());
      dioHelper
          .getData(
        url: 'api/admin/get_category_productForAdmin/1',
      )
          .then((value) async {
        if (value != null) {
          categoriesModel = AdminCategory.fromJson(value);
          emit(GetCategorySuccessState());
        }
        print(value.toString());
        //  Logger().d(value);
      }).catchError((error) {
        emit(GetCategoryErrorState());
        print(error.toString());
        //  Logger().e(error);
      });
    } catch (e) {
      emit(GetCategoryErrorState());
      print(e);
    }
  }
}
