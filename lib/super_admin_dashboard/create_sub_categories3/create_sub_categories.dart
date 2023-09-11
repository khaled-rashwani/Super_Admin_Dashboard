import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../categories/categories_cubit/cubit.dart';
import '../shared/components/components.dart';
import '../../project_shared/constants.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class CreateSubcategoriesScreen extends StatefulWidget {
  @override
  State<CreateSubcategoriesScreen> createState() =>
      _CreateSubcategoriesScreenState();
}

class _CreateSubcategoriesScreenState extends State<CreateSubcategoriesScreen> {
  var subcategoryNameController = TextEditingController();
  var selectedCategory;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return   BlocProvider(
        create: (context) => CreateSubCategoriesCubit()..getCategoriesName(),
        child: BlocConsumer<CreateSubCategoriesCubit, CreateSubCategoriesStates>(
          listener: (context, state) {
            if(state is CreateSubCategoriesSuccessState){
              Fluttertoast.showToast(
                  msg: "Category created successfully",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            }
            else if(state is CreateSubCategoriesErrorState){
              Fluttertoast.showToast(
                  msg:"Category was not created successfully" ,
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            }
          },
          builder: (context, state) {
            if (state is getCategoriesNameSuccessState || state is CreateSubCategoriesSuccessState) {
              return  Scaffold(
                  appBar: AppBar(
                    backgroundColor: myDarkBG,
                    elevation: 0,
                  ),
                  body: Stack(
                    children: [
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
                                        style:
                                        TextStyle(fontSize: 10, color: Colors.grey),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: Text(
                                            "Create new Subcategory",
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
                                            CreateSubCategoriesCubit.get(context)
                                                .imageCheck
                                                ? InkWell(
                                                onTap: () {
                                                  CreateSubCategoriesCubit.get(
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
                                                  CreateSubCategoriesCubit.get(
                                                      context)
                                                      .khaled,
                                                  fit: BoxFit.cover,)
                                            ),
                                            Container(
                                              width: 400,
                                              height: 260,
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: 60,
                                                    width: 400,
                                                    child: DropdownButton(
                                                      hint: Text("Select Category"),
                                                      items: CreateSubCategoriesCubit
                                                          .get(context)
                                                          .getCategoryNameModel.data!
                                                          .map((e) => DropdownMenuItem(
                                                        child: Text('${e.name}'),
                                                        value: e.id,
                                                      ))
                                                          .toList(),
                                                      onChanged: (val) {
                                                        setState(() {
                                                          selectedCategory = val!;
                                                        });
                                                      },
                                                      value: selectedCategory,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    height: 60,
                                                    width: 400,
                                                    child: TextFormField(
                                                      controller:
                                                      subcategoryNameController,
                                                      onFieldSubmitted: (value) {},
                                                      validator: (value) {
                                                        if (value!.isEmpty) {
                                                          return "Category name must not be empty";
                                                        }
                                                        return null;
                                                      },
                                                      decoration: InputDecoration(
                                                        labelText: "Subcategory Name",
                                                        prefixIcon:
                                                        Icon(Icons.category_outlined),
                                                        border: OutlineInputBorder(),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                      height: 60,
                                                      width: 180,
                                                      child: ConditionalBuilder(
                                                        condition: state is! CreateSubCategoriesLoadingState,
                                                        //condition: true,
                                                        builder: (context) =>defaultCreatebuttom(
                                                            height: 60,
                                                            width: 180,
                                                            label: "Create Sub Category",
                                                            onTap: () {
                                                              if (formKey.currentState!.validate()) {
                                                                CreateSubCategoriesCubit.get(context).CreateSubCategoris(
                                                                  CategoryName: subcategoryNameController.text, ParentId: selectedCategory,/*Image :CreateCategoriesCubit.get(context).k?.path.toString()*/);
                                                                //Dragon Context
                                                              }
                                                            }),
                                                        fallback: (context) =>Center(child: CircularProgressIndicator(),),
                                                      )
                                                  ),
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
            } else if (state is getCategoriesNameLoadingState  || state is CreateSubCategoriesLoadingState )
              return Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/images/background3.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Center(child: CircularProgressIndicator()),
                ],
              );
            else
              return Container();

          },
        ));
  }
}
