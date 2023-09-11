import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_admin_dashboard/login/login_screen.dart';
import 'package:super_admin_dashboard/super_admin_dashboard/shared/components/components.dart';
import '../../../login/login_cubit/login_cubit.dart';
import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/states.dart';
import '../../../project_shared/constants.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardCubit, DashboardStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = DashboardCubit.get(context);
        return Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                child: Image.asset("assets/images/logo.png"),
              ),
              DrawerListTile(
                title: "Home",
                icon: Icon(Icons.dashboard,
                    color:
                        cubit.currentIndex == 0 ? primaryColor : Colors.grey),
                press: () {
                  cubit.changeDrawer(0);
                },
              ),
              DrawerListTile(
                title: "Users",
                icon: Icon(Icons.person,
                    color:
                        cubit.currentIndex == 1 ? primaryColor : Colors.grey),
                press: () {
                  cubit.changeDrawer(1);
                },
              ),
              DrawerListTile(
                title: "Admins",
                icon: Icon(Icons.group,
                    color:
                        cubit.currentIndex == 2 ? primaryColor : Colors.grey),
                press: () {
                  cubit.changeDrawer(2);
                },
              ),
              DrawerListTile(
                title: "Categories",
                icon: Icon(Icons.category_outlined,
                    color:
                        cubit.currentIndex == 3 ? primaryColor : Colors.grey),
                press: () {
                  cubit.changeDrawer(3);
                },
              ),
              DrawerListTile(
                title: "Sub Categories",
                icon: Icon(Icons.subscriptions_rounded,
                    color:
                    cubit.currentIndex == 4 ? primaryColor : Colors.grey),
                press: () {
                  cubit.changeDrawer(4);
                },
              ),
              //ProductPropertiesScreen
              DrawerListTile(
                title: "Product Properties",
                icon: Icon(Icons.palette_rounded,
                    color:
                    cubit.currentIndex == 5 ? primaryColor : Colors.grey),
                press: () {
                  cubit.changeDrawer(5);
                },
              ),
              // DrawerListTile(
              //   title: "Products",
              //   icon: Icon(Icons.shopify_rounded,
              //       color:
              //       cubit.currentIndex == 6 ? primaryColor : Colors.grey),
              //   press: () {
              //     cubit.changeDrawer(6);
              //   },
              // ),
              DrawerListTile(
                title: "Products Request",
                icon: Icon(Icons.remove_from_queue,
                    color:
                    cubit.currentIndex == 6 ? primaryColor : Colors.grey),
                press: () {
                  cubit.changeDrawer(6);
                },
              ),
              DrawerListTile(
                title: "Orders",
                icon: Icon(Icons.shopping_cart,
                    color:
                        cubit.currentIndex == 7 ? primaryColor : Colors.grey),
                press: () {
                  cubit.changeDrawer(7);
                },
              ),
              DrawerListTile(
                title: "Advertisements",
                icon: Icon(Icons.dock,
                    color:
                        cubit.currentIndex == 8 ? primaryColor : Colors.grey),
                press: () {
                  cubit.changeDrawer(8);
                },
              ),
              DrawerListTile(
                title: "LOGOUT",
                icon: Icon(Icons.login_sharp,
                    color:
                    Colors.red),

                press: () async {
                  bool _islogedout = await AuthCubit.get(context).superAdminLogout(context);
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
