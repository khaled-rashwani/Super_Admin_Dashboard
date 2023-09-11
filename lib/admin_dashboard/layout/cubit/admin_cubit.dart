import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../admin_category/admin_categories.dart';
import '../../admin_create_product/create_product_screen.dart';
import '../../admin_home_screen/admin_home_screen.dart';
import '../../admin_order/admin_orders.dart';
import '../../admin_product/admin_products.dart';
import '../../product/screen.dart';
import '../../variants/screen.dart';
import '../../variants/variantsScreen.dart';
import 'admin_states.dart';


class AdminDashboardCubit extends Cubit<AdminDashboardStates> {
  AdminDashboardCubit() : super(DashboardInitialState());

  static AdminDashboardCubit get(context) => BlocProvider.of(context);

  //Drawer Data
  int currentIndex = 0;
  List<Widget> screens = [
    //AdminCategoriesScreen(),
    XAdminProductScreen(),
    CreateProductScreen(),
    CreateVariantsScreen2(),
  ];

  void changeDrawer(int index) {
    currentIndex = index;
    emit(DashboardDrawerState());
  }




}