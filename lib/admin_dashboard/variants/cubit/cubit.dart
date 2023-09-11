import 'dart:html';
import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:super_admin_dashboard/admin_dashboard/variants/cubit/states.dart';
import 'package:super_admin_dashboard/project_shared/network/dio.dart';
import 'package:super_admin_dashboard/project_shared/network/shared_preferences.dart';
import 'package:super_admin_dashboard/super_admin_dashboard/create_categories/create_categories_cubit/states.dart';
import 'package:super_admin_dashboard/super_admin_dashboard/create_sub_categories3/cubit/states.dart';
import 'package:flutter/material.dart';
import '../model.dart';
import 'package:flutter/material.dart' as FlutterMaterial;
class VariantsCubit extends Cubit<VariantsStates> {
  VariantsCubit() : super(VariantsInitialState());

  ColorsVariantsModel getColorsVariantsModel = ColorsVariantsModel();
  SizesVariantsModel getSizesVariantsModel = SizesVariantsModel();
  ProductNameModel productNameModel = ProductNameModel();

  static VariantsCubit get(context) => BlocProvider.of(context);
  dynamic id = CacheHelper.getData(key: 'id') ?? 0;




  void getVariantsData() {
    bool getRate = false, getComments = false, getProfile = false;
    try {
      emit(LastVariantsLoadingState());
      final ColorDataFuture = dioHelper.getData(
        url: 'api/product/get_colors',
      );
      final SizeDataFuture = dioHelper.getData(
        url: 'api/product/get_type_sizes/1',
      );
      final productDataFuture = dioHelper.getData(
        url: 'api/product/get_admin_products/$id',
      );
      Future.wait([
        ColorDataFuture,
        SizeDataFuture,
        productDataFuture,
      ]).then((responses) {
        final ColorData = responses[0];
        final SizeData = responses[1];
        final productData = responses[2];
        if (ColorData != null) {
          //  ColorsVariantsModel getColorsVariantsModel = ColorsVariantsModel();
          getColorsVariantsModel = ColorsVariantsModel.fromJson(ColorData);
          getRate = true;
        }
        if (SizeData != null) {
          //  SizesVariantsModel getSizesVariantsModel = SizesVariantsModel();
          getSizesVariantsModel = SizesVariantsModel.fromJson(SizeData);
          getComments = true;
        }
        if (productData != null) {
          //  ProductNameModel productNameModel = ProductNameModel();
          productNameModel = ProductNameModel.fromJson(productData);
          getProfile = true;
        }

        if (getRate && getComments && getProfile) {
          emit(LastVariantsSuccessState());
        } else {
          emit(LastVariantsErrorState());
        }
      }).catchError((error) {
        emit(LastVariantsErrorState());
      });
    } catch (e) {
      emit(LastVariantsErrorState());
    }
  }
  //
  // void getColors() {
  //   try {
  //     emit(GetColorLoadingState());
  //     dioHelper
  //         .getData(
  //       url: 'api/product/get_colors',
  //     )
  //         .then((value) async {
  //       if (value != null) {
  //         getColorsVariantsModel = ColorsVariantsModel.fromJson(value);
  //         emit(GetColorSuccessState());
  //       }
  //       print(value.toString());
  //     }).catchError((error) {
  //       emit(GetColorErrorState());
  //       print(error.toString());
  //     });
  //   } catch (e) {
  //     emit(GetColorErrorState());
  //     print(e);
  //   }
  // }
  //
  // void getSizes() {
  //   try {
  //     emit(GetSizesLoadingState());
  //     dioHelper
  //         .getData(
  //       url: 'api/product/get_type_sizes/1',
  //     )
  //         .then((value) async {
  //       if (value != null) {
  //         getSizesVariantsModel = SizesVariantsModel.fromJson(value);
  //         emit(GetSizesSuccessState());
  //       }
  //       print(value.toString());
  //     }).catchError((error) {
  //       emit(GetSizesErrorState());
  //       print(error.toString());
  //     });
  //   } catch (e) {
  //     emit(GetSizesErrorState());
  //     print(e);
  //   }
  // }
  //
  // void getProductName() {
  //   print("XXXXXXXXXXXXXXXXXX");
  //   print(id);
  //   print("XXXXXXXXXXXXXXXXXX");
  //   try {
  //     emit(GetProductNameLoadingState());
  //     dioHelper
  //         .getData(
  //       url: 'api/product/get_admin_products/$id',
  //     )
  //         .then((value) async {
  //       if (value != null) {
  //         productNameModel = ProductNameModel.fromJson(value);
  //         emit(GetProductNameSuccessState());
  //       }
  //       print(value.toString());
  //     }).catchError((error) {
  //       emit(GetProductNameErrorState());
  //       print(error.toString());
  //     });
  //   } catch (e) {
  //     emit(GetProductNameErrorState());
  //     print(e);
  //   }
  // }

  Future<void> AddVar(
      {required List<Map<String, String>> ProductVariants, required id}) async {

    emit(AddVariantsLoadingState());
    dioHelper
        .postData(url: 'api/product/add_variants/$id', data: {
          'variants': ProductVariants,
        })
        .then((value) {
            emit(AddVariantsSuccessState());

    })
        .catchError((error) {
          emit(AddVariantsErrorState());
    });
  }
}
