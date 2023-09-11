import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_admin_dashboard/project_shared/network/dio.dart';
import 'package:super_admin_dashboard/super_admin_dashboard/products_request/cubit/states.dart';
import '../../../project_shared/network/shared_preferences.dart';
import '../model.dart';


class ProductRequestCubit extends Cubit<ProductRequestStates> {
  ProductRequestCubit() : super(ProductRequestInitialState());

  static ProductRequestCubit get(context) => BlocProvider.of(context);

  ProductRequestModel productRequestModel = ProductRequestModel();

  void getProductRequest() {

    try {
      emit(ProductRequestLoadingState());
      dioHelper
          .getData(
        url: 'api/product/get_pending_products',
      )
          .then((value) async {
        if (value != null) {
          productRequestModel = ProductRequestModel.fromJson(value);
          emit(ProductRequestSuccessState());
        }
        print(value.toString());
      }).catchError((error) {
        emit(ProductRequestErrorState());
        print(error.toString());
      });
    } catch (e) {
      emit(ProductRequestErrorState());
      print(e);
    }
  }

  void ProductAccept({required int ProductId ,  required int Action,/*String? Image*/ }) {
    emit(ProductAcceptLoadingState());
    dioHelper.postData(
        url: 'api/product/aprove_product',
        data: {'product_id': ProductId ,'approved':ProductId/*'image':Image*/})
        .then((value) {
          getProductRequest();
      emit(ProductAcceptSuccessState());
    }).catchError((error) {
      emit(ProductAcceptErrorState());
    });
  }





}
