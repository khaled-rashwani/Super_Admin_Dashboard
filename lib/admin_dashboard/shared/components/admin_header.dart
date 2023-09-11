import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../project_shared/constants.dart';
import '../../../project_shared/responsive.dart';
import '../../layout/cubit/admin_cubit.dart';
import '../../layout/cubit/admin_menu_app_controller.dart';
import '../../layout/cubit/admin_states.dart';


class AdminHeader extends StatelessWidget {
  const AdminHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Row(children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: context.read<AdminMenuAppController>().controlMenu,
          ),
        Text(
          "Dashboard",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ]),
    );
  }
}

class AdminDesktopHeader extends StatelessWidget {
  List title = [
    "Products",
    "Create Product ",
    "Add More Colors and Sizes Screen",
  ];

  AdminDesktopHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminDashboardCubit, AdminDashboardStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AdminDashboardCubit.get(context);
          return Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Container(
                alignment: Alignment.topCenter,
                width: double.infinity,
                height: 40,
                child: Text("${title[cubit.currentIndex]}",
                    style: TextStyle(fontSize: 25, color: Colors.white)),
              ));
        });
  }
}
