import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../login/login_cubit/login_cubit.dart';
import '../../../login/login_screen.dart';
import '../../../project_shared/constants.dart';
import '../../../super_admin_dashboard/shared/components/components.dart';
import '../../layout/cubit/admin_cubit.dart';
import '../../layout/cubit/admin_states.dart';


class AdminDrawer extends StatelessWidget {
  const AdminDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminDashboardCubit, AdminDashboardStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AdminDashboardCubit.get(context);
        return Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                child: Image.asset("assets/images/logo.png"),
              ),

              // DrawerListTile(
              //   title: "Categories",
              //   icon: Icon(Icons.category_outlined,
              //       color:
              //       cubit.currentIndex == 0 ? primaryColor : Colors.grey),
              //   press: () {
              //   //  CategoryCubit.get(context).getCategories();
              //     cubit.changeDrawer(0);
              //   },
              // ),

              DrawerListTile(
                title: "Products",
                icon: Icon(Icons.shopify_rounded,
                    color:
                    cubit.currentIndex == 0 ? primaryColor : Colors.grey),
                press: () {
                  cubit.changeDrawer(0);
                },
              ),
              // DrawerListTile(
              //   title: "Orders",
              //   icon: Icon(Icons.shopping_cart,
              //       color:
              //       cubit.currentIndex == 2 ? primaryColor : Colors.grey),
              //   press: () {
              //     cubit.changeDrawer(2);
              //   },
              // ),
              DrawerListTile(
                title: "Create Product",
                icon: Icon(Icons.add_business_outlined,
                    color:
                    cubit.currentIndex == 1 ? primaryColor : Colors.grey),
                press: () {
                  cubit.changeDrawer(1);
                },
              ),
              DrawerListTile(
                title: "Add Variants",
                icon: Icon(Icons.add_circle_outline,
                    color:
                    cubit.currentIndex == 2 ? primaryColor : Colors.grey),
                press: () {
                  cubit.changeDrawer(2);
                },
              ),
              // DrawerListTile(
              //   title: "Profile",
              //   icon: Icon(Icons.person,
              //       color:
              //       cubit.currentIndex == 3 ? primaryColor : Colors.grey),
              //   press: () {
              //     cubit.changeDrawer(3);
              //   },
              // ),
              DrawerListTile(
                title: "LOGOUT",
                icon: Icon(Icons.login_sharp,
                    color:
                    Colors.red),

                press: () async {
                  bool _islogedout = await AuthCubit.get(context).logout(context);
                  if (_islogedout)
                    NavigateAndFinish(context, LoginScreen());
                  print("++++++++++++++++++");
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile(
      {Key? key,
        // For selecting those three line once press "Command+D"
        required this.title,
        required this.press,
        this.isSelected,
        required this.icon})
      : super(key: key);
  final Icon icon;
  final String title;
  final VoidCallback press;
  final bool? isSelected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: icon,

      title: Text(
        title,
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}
