import 'dart:typed_data';
import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../shared/components/components.dart';
import '../../project_shared/constants.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'create_categories_cubit/cubit.dart';
import 'create_categories_cubit/states.dart';

class CreateCategoriesScreen extends StatelessWidget {
  var categoryNameController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CreateCategoriesCubit(),
        child: BlocConsumer<CreateCategoriesCubit, CreateCategoriesStates>(
          listener: (context, state) {
            if (state is CreateCategoriesSuccessState) {
              Fluttertoast.showToast(
                  msg: "Category created successfully",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0);
            } else if (state is CreateCategoriesErrorState) {
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
            return Scaffold(
                appBar: AppBar(
                  backgroundColor: myDarkBG,
                  elevation: 0,
                ),
                body: Stack(
                  children: [
// Background image
                    Positioned.fill(
                      child: Image.asset(
                        'assets/images/background3.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 700,
                        height: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Form(
                            key: formKey,
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      "We've welcomed a new company to our community",
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.grey),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        child: Text(
                                          "Create new Category",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 35),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 17),
                                        child: Container(
                                          width: 8,
                                          height: 8,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: primaryColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 200,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CreateCategoriesCubit.get(context)
                                                  .imageCheck
                                              ? InkWell(
                                                  onTap: () {
                                                    CreateCategoriesCubit.get(
                                                            context)
                                                        .pickImage();
                                                  },
                                                  child: DottedBorder(
                                                    color: Colors.grey,
                                                    strokeWidth: 5,
                                                    dashPattern: [
                                                      16,
                                                      16,
                                                      16,
                                                      16
                                                    ],
                                                    child: Container(
                                                      width: 200,
                                                      height: 200,
                                                      child: Icon(
                                                        Icons.add,
                                                        color: Colors.grey,
                                                        size: 60,
                                                      ),
                                                    ),
                                                  ))
                                              : Container(
                                                  width: 200,
                                                  height: 200,
                                                  //Image.memory(Uint8List.fromList(_selectedFile!))
                                              //child:Image.memory(CreateCategoriesCubit.get(context).view)
                                                  child: Image.memory(
                                                    CreateCategoriesCubit.get(
                                                            context)
                                                        .khaled,
                                                    fit: BoxFit.cover,)
                                                  ),

//
                                          Container(
                                            width: 400,
                                            height: 200,
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 60,
                                                ),
                                                Container(
                                                  height: 60,
                                                  width: 400,
                                                  child: TextFormField(
                                                    controller:
                                                        categoryNameController,
                                                    onFieldSubmitted:
                                                        (value) {},
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return "Category name must not be empty";
                                                      }
                                                      return null;
                                                    },
                                                    decoration: InputDecoration(
                                                      labelText:
                                                          "Category Name",
                                                      prefixIcon: Icon(Icons
                                                          .category_outlined),
                                                      border:
                                                          OutlineInputBorder(),
                                                    ),
                                                  ),
                                                ),
                                                // Container(
                                                //   height: 60,
                                                //   width: 180,
                                                //   child: defaultCreatebuttom(
                                                //       height: 60,
                                                //       width: 180,
                                                //       label: "Create Category",
                                                //       onTap: () {
                                                //         if (formKey.currentState!.validate()) {
                                                //           print(categoryNameController.text);
                                                //         }
                                                //       }),
                                                // ),
                                                // Center(
                                                //     child : ConditionalBuilder(
                                                //       // condition: state is! CreateCategoriesLoadingState,
                                                //       condition: true,
                                                //       builder: (context) =>defaultCreatebuttom(
                                                //           height: 60,
                                                //           width: 180,
                                                //           label: "Create Category",
                                                //           onTap: () {
                                                //             if (formKey.currentState!.validate()) {
                                                //               CreateCategoriesCubit.get(context).CreateCategorisFun(
                                                //                 CategoryName: categoryNameController.text,);
                                                //               //Dragon Context
                                                //             }
                                                //           }),
                                                //       fallback: (context) =>Center(child: CircularProgressIndicator(),),
                                                //     )
                                                // )
                                                Center(
                                                    child: ConditionalBuilder(
                                                  condition: state
                                                      is! CreateCategoriesLoadingState,
                                                  //condition: true,
                                                  builder: (context) =>
                                                      defaultCreatebuttom(
                                                          height: 60,
                                                          width: 180,
                                                          label:
                                                              "Create Category",
                                                          onTap: () {
                                                            if (formKey
                                                                .currentState!
                                                                .validate()) {
                                                              CreateCategoriesCubit
                                                                      .get(
                                                                          context)
                                                                  .CreateCategorisFun(
                                                                CategoryName:
                                                                    categoryNameController
                                                                        .text, /*Image :CreateCategoriesCubit.get(context).k?.path.toString()*/
                                                              );
                                                              //Dragon Context
                                                            }
                                                          }),
                                                  fallback: (context) => Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  ),
                                                ))
                                              ],
                                            ),
                                          ),
                                        ]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ));
          },
        ));
  }
}
