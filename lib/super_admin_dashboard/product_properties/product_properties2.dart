import 'dart:core';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../categories/categories_cubit/cubit.dart';
import '../shared/components/components.dart';
import '../../project_shared/constants.dart';
import 'TypeName.dart';
import 'TypeName.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';
import 'model.dart';
import 'model.dart';
import 'model.dart';

class ProductPropertiesScreen extends StatefulWidget {
  @override
  State<ProductPropertiesScreen> createState() =>
      _ProductPropertiesScreenState();
}

class _ProductPropertiesScreenState extends State<ProductPropertiesScreen> {
  var colorNameController = TextEditingController();
  var colorCodeController = TextEditingController();
  var TypeNameController = TextEditingController();
  var SizeController = TextEditingController();
  var ColorformKey = GlobalKey<FormState>();
  var TypeformKey = GlobalKey<FormState>();
  var ShoesformKey = GlobalKey<FormState>();
  var selectedType;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ProductPropertiesCubit()..GetTypeName(),
        child: BlocConsumer<ProductPropertiesCubit, ProductPropertiesStates>(
          listener: (context, state) {
            if (state is CreateColorSuccessState ||
                state is CreateTypeSuccessState ||
                state is GetTypeNameSuccessState ||
                state is CreateSizeSuccessState
            ) {
              Fluttertoast.showToast(
                  msg: "Property created successfully",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0);
            } else if (state is CreateColorErrorState ||
                state is CreateTypeErrorState ||
                state is CreateSizeErrorState) {
              Fluttertoast.showToast(
                  msg: "Category was not created successfully",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          },
          builder: (context, state) {
            if (state is CreateColorSuccessState ||
                state is CreateTypeSuccessState ||
                state is GetTypeNameSuccessState ||
                state is CreateSizeSuccessState) {
              return Padding(
                  padding: const EdgeInsets.only(top: 130, left: 50, right: 50),
                  child: Container(
                    color: myDarkBG,
                    width: double.infinity,
                    height: 440,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Form(
                          key: ColorformKey,
                          child: Container(
                            width: 330,
                            height: 440,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    child: Image.asset(
                                  'assets/images/color.png',
                                  width: 200,
                                  height: 200,
                                )),
                                Container(
                                  child: TextFormField(
                                    controller: colorNameController,
                                    onFieldSubmitted: (value) {},
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Color Name must not be empty";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText: "Color Name",
                                      prefixIcon: Icon(Icons.color_lens),
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: TextFormField(
                                    controller: colorCodeController,
                                    onFieldSubmitted: (value) {},
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Color Code must not be empty";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText: "Color Code",
                                      prefixIcon:
                                          Icon(Icons.qr_code_scanner_rounded),
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                                Container(
                                    height: 65,
                                    width: 180,
                                    child: defaultCreatebuttom(
                                        height: 60,
                                        width: 180,
                                        label: "Create Color",
                                        onTap: () {
                                          if (ColorformKey.currentState!
                                              .validate()) {
                                            ProductPropertiesCubit.get(context)
                                                .CreateColor(
                                                    ColorName:
                                                        colorNameController
                                                            .text,
                                                    ColorCode:
                                                        colorCodeController
                                                            .text);
                                            print(colorNameController.text);
                                            print(colorCodeController.text);
                                          }
                                        })),
                              ],
                            ),
                          ),
                        ),
                        Form(
                          key: TypeformKey,
                          child: Container(
                            width: 330,
                            height: 440,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    child: Image.asset(
                                  'assets/images/type.png',
                                  width: 200,
                                  height: 200,
                                )),

                                Container(
                                  child: TextFormField(
                                    controller: TypeNameController,
                                    onFieldSubmitted: (value) {},
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Type Name must not be empty";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText: "Type Name",
                                      prefixIcon: Icon(Icons.type_specimen_outlined),
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                                Container(
                                    height: 65,
                                    width: 180,
                                    child: defaultCreatebuttom(
                                        height: 60,
                                        width: 180,
                                        label: "Create New Type",
                                        onTap: () {
                                          if (TypeformKey.currentState!
                                              .validate()) {
                                            ProductPropertiesCubit.get(context)
                                                .CreateType(
                                                    Type: TypeNameController
                                                        .text);
                                          }
                                        })),
                              ],
                            ),
                          ),
                        ),
                        Form(
                          key: ShoesformKey,
                          child: Container(
                            width: 330,
                            height: 440,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Image.asset(
                                    'assets/images/size.png',
                                    width: 200,
                                    height: 200,
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                    child: DropdownButton(
                                      hint: Text("Select Type"),
                                      items: ProductPropertiesCubit.get(
                                          context)
                                          .getTypeNameModel
                                          .types!
                                          .map((e) => DropdownMenuItem(
                                        child: Text('${e.type}'),
                                        value: e.id,
                                      ))
                                          .toList(),
                                      onChanged: (val) {
                                        setState(() {

                                          selectedType = val!;
                                          print(selectedType);
                                          // Variants[1][1] =selectedColor;
                                          //print('$selectedColor');
                                        });
                                      },
                                      value: selectedType,
                                    )
                                ),
                                Container(
                                  child: TextFormField(
                                    controller: SizeController,
                                    onFieldSubmitted: (value) {},
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Size must not be empty";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText: "Size",
                                      prefixIcon: Icon(Icons.square_foot),
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                                Container(
                                    height: 65,
                                    width: 180,
                                    child: defaultCreatebuttom(
                                        height: 60,
                                        width: 180,
                                        label: "Create Size",
                                        onTap: () {
                                          if (ShoesformKey.currentState!
                                              .validate()) {
                                            ProductPropertiesCubit.get(context)
                                                .CreateSize(
                                              TypeId: selectedType.toString(),
                                                Size:
                                                        SizeController
                                                            .text);
                                          }
                                        })),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ));
            } else if (state is CreateColorLoadingState ||
                state is CreateTypeLoadingState ||
                state is CreateSizeLoadingState
            || state is GetTypeNameSuccessState
            )
              return Stack(
                children: [
                  Center(child: CircularProgressIndicator()),
                ],
              );
            else
              return Container();
          },
        ));
  }
}
