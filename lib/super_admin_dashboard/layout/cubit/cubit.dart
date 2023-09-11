import 'package:bloc/bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_admin_dashboard/super_admin_dashboard/layout/cubit/states.dart';
import '../../../project_shared/constants.dart';
import '../../admins/admin_screen.dart';
import '../../ads/ads_screen.dart';
import '../../categories/categories.dart';
import '../../home_screen2/home_sceen.dart';
import '../../orders/order.dart';
import '../../product_properties/product_properties2.dart';
import '../../product_properties/product_properties_screen2.dart';
import '../../products_request/ProductRequestScreen.dart';
import '../../products_request/products_request.dart';
import '../../sub_categories/sub_category_screen.dart';
import '../../users/users_screen.dart';


class DashboardCubit extends Cubit<DashboardStates> {
  DashboardCubit() : super(DashboardInitialState());

  static DashboardCubit get(context) => BlocProvider.of(context);

  //Drawer Data
  int currentIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    UsersScreen(),
    AdminsScreen(),
    SuperCategoriesScreen(),
    SubCategoryScreen(),
    ProductPropertiesScreen(),
    //ProductsScreen(),
    //ProductsRequestScreen(),
    ProductRequestScreen2(),
    OrderScreen(),
    AdsScreen(),
  ];

  void changeDrawer(int index) {
    currentIndex = index;
    emit(DashboardDrawerState());
  }



  //Graph Data
  List<AddGraphData> GraphData = [
    AddGraphData(name: "Adidas", percent: 40, color: Colors.pink),
    AddGraphData(name: "Nike", percent: 15, color: Colors.deepPurple),
    AddGraphData(name: "apple", percent: 40, color: primaryColor),
    AddGraphData(name: "Others", percent: 5, color: Colors.cyan),
  ];

  List<PieChartSectionData> getGraphSections() => GraphData.asMap()
      .map<int, PieChartSectionData>((index, GraphData) {
        final value = PieChartSectionData(
          color: GraphData.color,
          value: GraphData.percent,
          title: '${GraphData.percent}%', //the title on the section in graph
          titleStyle: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        );
        return MapEntry(index, value);
      })
      .values
      .toList();



}

class AddGraphData {
  AddGraphData(
      {required this.name, required this.percent, required this.color});

  final String name;
  final double percent;
  final Color color;
}
