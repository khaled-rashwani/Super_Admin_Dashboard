import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../project_shared/responsive.dart';
import '../shared/components/admin_drawer.dart';
import '../shared/components/admin_header.dart';
import 'cubit/admin_cubit.dart';
import 'cubit/admin_menu_app_controller.dart';
import 'cubit/admin_states.dart';


class AdminDashboardLayout extends StatelessWidget {
  const AdminDashboardLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminDashboardCubit, AdminDashboardStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AdminDashboardCubit.get(context);

        return Scaffold(
          key: context.read<AdminMenuAppController>().scaffoldKey,
          drawer: AdminDrawer(),
          body: SafeArea(
            child: Stack(
              children: [
                if(Responsive.isDesktop(context))
                  AdminDesktopHeader(),
                AdminHeader(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // We want this side menu only for large screen
                    if (Responsive.isDesktop(context))
                      Expanded(
                        // default flex = 1
                        // and it takes 1/6 part of the screen
                        child:AdminDrawer(),
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
