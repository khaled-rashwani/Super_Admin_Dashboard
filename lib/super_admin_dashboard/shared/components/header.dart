import 'dart:core';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/menu_app_controller.dart';
import '../../layout/cubit/states.dart';
import '../../../project_shared/constants.dart';
import '../../../project_shared/responsive.dart';

class Header extends StatelessWidget {
  const Header({
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
            onPressed: context.read<MenuAppController>().controlMenu,
          ),
        Text(
          "Dashboard",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ]),
    );
  }
}

class DesktopHeader extends StatelessWidget {
  List title = [
    "Home Screen",
    "Users Screen",
    "Admins Screen",
    "Categories Screen",
    "Sub Categories Screen",
    "Products Screen",
    "Products Request Screen",
    "Order Screen",
    "Advertisement Screen"
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardCubit, DashboardStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = DashboardCubit.get(context);
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
