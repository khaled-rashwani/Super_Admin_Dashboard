import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:super_admin_dashboard/project_shared/network/dio.dart';
import 'package:super_admin_dashboard/super_admin_dashboard/create_categories/create_categories_cubit/states.dart';
import 'package:super_admin_dashboard/super_admin_dashboard/create_sub_categories3/cubit/states.dart';
import 'package:super_admin_dashboard/super_admin_dashboard/product_properties/cubit/states.dart';
import '../../categories/categories_model.dart';
import '../TypeName.dart';



class ProductPropertiesCubit extends Cubit<ProductPropertiesStates> {
  ProductPropertiesCubit() : super(ProductPropertiesInitialState());



  GetTypeNameModel getTypeNameModel = GetTypeNameModel();
  static ProductPropertiesCubit get(context) => BlocProvider.of(context);

  void CreateColor({required String ColorName ,  required String ColorCode }) {
    emit(CreateColorLoadingState());
    dioHelper.postData(
        url: 'api/product/add_color',
        data: {'color': ColorName ,'hex':ColorCode })
        .then((value) {
      emit(CreateColorSuccessState());
    }).catchError((error) {
      emit(CreateColorErrorState());
    });
  }


  void CreateType({required String Type  }) {
    emit(CreateTypeLoadingState());
    dioHelper.postData(
        url: 'api/product/add_type',
        data: {'type': Type })
        .then((value) {
      emit(CreateTypeSuccessState());
    }).catchError((error) {
      emit(CreateTypeErrorState());
    });
  }

  void CreateSize({required String Size ,required String TypeId }) {
    emit(CreateSizeLoadingState());
    dioHelper.postData(
        url: 'api/product/add_size/${TypeId}',
        data: {'size': Size })
        .then((value) {
      emit(CreateSizeSuccessState());
    }).catchError((error) {
      emit(CreateSizeErrorState());
    });
  }


  void GetTypeName() {
    try {
      emit(GetTypeNameLoadingState());
      dioHelper
          .getData(
        url: 'api/product/get_types',
      )
          .then((value) async {
        if (value != null) {
          getTypeNameModel = GetTypeNameModel.fromJson(value);
          emit(GetTypeNameSuccessState());
        }
        print(value.toString());
        //  Logger().d(value);
      }).catchError((error) {
        emit(GetTypeNameErrorState());
        print(error.toString());
        //  Logger().e(error);
      });
    } catch (e) {
      emit(GetTypeNameErrorState());
      print(e);
    }
  }

  // void CreateShoesSize({required String ShoesSize  }) {
  //   emit(CreateShoesSizeLoadingState());
  //   dioHelper.postData(
  //       url: 'api/product/add_size/2',
  //       data: {'size': ShoesSize })
  //       .then((value) {
  //     emit(CreateShoesSizeSuccessState());
  //   }).catchError((error) {
  //     emit(CreateShoesSizeErrorState());
  //   });
  // }




}




