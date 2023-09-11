import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_admin_dashboard/project_shared/network/dio.dart';
import 'package:super_admin_dashboard/super_admin_dashboard/orders/cubit/states.dart';
import '../../../project_shared/network/shared_preferences.dart';
import '../order_model.dart';


class OrderCubit extends Cubit<OrderStates> {
  OrderCubit() : super(OrderInitialState());

  static OrderCubit get(context) => BlocProvider.of(context);

  OrderModel orderModel = OrderModel();

  void getOrder() {
    try {
      emit(OrderLoadingState());
      dioHelper
          .getData(
        url: 'api/user/Orders_History_for_all_users',
      )
          .then((value) async {
        if (value != null) {
          orderModel = OrderModel.fromJson(value);
          emit(OrderSuccessState());
        }
      }).catchError((error) {
        emit(OrderErrorState());
        print(error.toString());
      });
    } catch (e) {
      emit(OrderErrorState());
      print(e);
    }
  }

  void AcceptOrder({required String index} ) {
    emit(AcceptOrderLoadingState());
    dioHelper.postData(
        url: 'api/super_admin/updateState/${index}',
        data: {'state' : 1}).then((value) {
          getOrder();
      emit(AcceptOrderSuccessState());
    }).catchError((error) {
      emit(AcceptOrderErrorState());
    });
  }



}
