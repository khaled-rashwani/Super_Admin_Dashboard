import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/components/header.dart';
import '../../shared/components/my_drawer.dart';
import '../../../project_shared/responsive.dart';
import '../cubit/cubit.dart';
import '../cubit/menu_app_controller.dart';
import '../cubit/states.dart';

class DashboardLayout extends StatelessWidget {
  const DashboardLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardCubit, DashboardStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = DashboardCubit.get(context);

        return Scaffold(
          key: context.read<MenuAppController>().scaffoldKey,
          drawer: MyDrawer(),
          body: SafeArea(
            child: Stack(
              children: [
                if(Responsive.isDesktop(context))
                  DesktopHeader(),
                Header(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   // We want this side menu only for large screen
                    if (Responsive.isDesktop(context))
                      Expanded(
                        // default flex = 1
                        // and it takes 1/6 part of the screen
                        child:MyDrawer(),
                      ),
                    Expanded(
                        // It takes 5/6 part of the screen
                        flex: 5,
                        child: cubit.screens[cubit.currentIndex]),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
