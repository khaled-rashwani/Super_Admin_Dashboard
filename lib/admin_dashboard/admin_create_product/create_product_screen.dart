import 'dart:typed_data';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../project_shared/constants.dart';
import '../../super_admin_dashboard/shared/components/components.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class CreateProductScreen extends StatefulWidget {
  @override
  State<CreateProductScreen> createState() => _CreateProductScreenState();
}

class _CreateProductScreenState extends State<CreateProductScreen> {
  var nameProductController = TextEditingController();
  var selectedCategory;

  var selectedSubcategory;
  var selectedColor;
  var selectedSize;

  var tag_1Controller = TextEditingController();
  var tag_2Controller = TextEditingController();
  var tag_3Controller = TextEditingController();
  var priceProductController = TextEditingController();

  // var discountProductController = TextEditingController();
  TextEditingController discountProductController = TextEditingController();
  var quantityProductController = TextEditingController();
  var descriptionProductController = TextEditingController();
  final tagList = <String>[];
  final VariantTest = <int>[];

  List<List<int>> Variants =
      List.generate(1, (index) => List<int>.filled(3, 0));


  List<Map<String, String>> VariantMap = [
    {
      'color_id': '',
      'size_id': '',
      'variant_quantity': '',
    },
  ];



  // Add an element to the 2D array
  // int rowIndex = 1;
  // int columnIndex = 2;
  int count = 00;
  int price = 0;
  int discount =0 ;

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CreateProductCubit()..getData(),
        child: BlocConsumer<CreateProductCubit, CreateProductStates>(
          listener: (context, state) {
            if ( state is CreateProductSuccessState) {
              Fluttertoast.showToast(
                  msg: "Product created successfully",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0);
            } else if (state is GetCategoryNameErrorState) {
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
            if (state is LastSuccessState || state is ImagePickSuccessState || state is CreateProductSuccessState ) {
              return Scaffold(
                  appBar: AppBar(
                    backgroundColor: myDarkBG,
                    elevation: 0,
                  ),
                  body: Stack(
                    children: [
// Background image
//                       Positioned.fill(
//                         child: Image.asset(
//                           'assets/images/background3.png',
//                           fit: BoxFit.cover,
//                         ),
//                       ),
                      Center(
                        child: Container(
                          width: 700,
                          height: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: SingleChildScrollView(
                              child: Form(
                                key: formKey,
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
                                            "Add new Product",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 35),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 17),
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
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            InkWell(
                                                onTap: () {

                                                    CreateProductCubit.get(
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
                                            ,
                                            if(!CreateProductCubit.get(context)
                                                .imageCheck)
                                            Container(
                                                width: 300,
                                                height: 200,
                                                //Image.memory(Uint8List.fromList(_selectedFile!))
                                                //child:Image.memory(CreateCategoriesCubit.get(context).view)
                                                child:
                                                GridView.count(
                                                    shrinkWrap: true,
                                                    scrollDirection: Axis.horizontal,
                                                    crossAxisCount: 3,
                                                    childAspectRatio: 0.7,
                                                    crossAxisSpacing: 15,
                                                    mainAxisSpacing: 15,
                                                    children: List.generate(CreateProductCubit.get(context).Images.length, (index) {
                                                        return  Image.memory(
                                                            Uint8List.fromList(CreateProductCubit.get(
                                                                context)
                                                                .Images[index])
                                                        ,
                                                        fit: BoxFit.cover,height: 30,width: 20,
                                                        );
                                                      print(index);
                                                    })),

                                            )


                                            // InkWell(
                                            //   onTap: () {},
                                            //   child: DottedBorder(
                                            //     color: Colors.grey,
                                            //     strokeWidth: 5,
                                            //     dashPattern: [16, 16, 16, 16],
                                            //     child: Container(
                                            //       width: 200,
                                            //       height: 200,
                                            //       child: Icon(
                                            //         Icons.add,
                                            //         color: Colors.grey,
                                            //         size: 60,
                                            //       ),
                                            //     ),
                                            //   ),
                                            // ),
                                          ]),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      controller: nameProductController,
                                      onFieldSubmitted: (value) {},
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Product Name must not be empty";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        labelText: "Product Name ",
                                        prefixIcon:
                                            Icon(Icons.shopping_bag_outlined),
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 80,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                              child: DropdownButton<int>(
                                            hint: Text("Select Category"),
                                            items: CreateProductCubit.get(
                                                    context)
                                                .getCategoryNameModel
                                                .data!
                                                .asMap() // Use asMap to get both index and value
                                                .map((index, e) => MapEntry(
                                                      index,
                                                      DropdownMenuItem(
                                                        child:
                                                            Text('${e.name}'),
                                                        value:
                                                            index, // Store index as the value
                                                      ),
                                                    ))
                                                .values
                                                .toList(),
                                            onChanged: (val) {
                                              setState(() {
                                                selectedCategory = val!;
                                                // print(
                                                //     'Selected category index: $selectedCategory');
                                              });
                                            },
                                            value:
                                                selectedCategory, // Use the index as the value
                                          )),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Expanded(
                                              child: DropdownButton<int>(
                                            hint: Text("Select SubCategory"),
                                            items: selectedCategory == null
                                                ? null // No items when selectedCategory is null
                                                : CreateProductCubit.get(
                                                        context)
                                                    .getCategoryNameModel
                                                    .data![selectedCategory]
                                                    .children!
                                                    .map((e) =>
                                                        DropdownMenuItem(
                                                          child:
                                                              Text('${e.name}'),
                                                          value: e.id,
                                                        ))
                                                    .toList(),
                                            onChanged: (val) {
                                              setState(() {
                                                selectedSubcategory = val!;
                                               // print('$selectedSubcategory');
                                              });
                                            },
                                            value: selectedSubcategory,
                                          )),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 80,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                              child: DropdownButton(
                                            hint: Text("Select Color"),
                                            items: CreateProductCubit.get(
                                                    context)
                                                .getColorsModel
                                                .colors!
                                                .map((e) => DropdownMenuItem(
                                                      child: Text('${e.color}'),
                                                      value: e.id,
                                                    ))
                                                .toList(),
                                            onChanged: (val) {
                                              setState(() {
                                                selectedColor = val!;
                                               // Variants[1][1] =selectedColor;
                                                //print('$selectedColor');
                                              });
                                            },
                                            value: selectedColor,
                                          )),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Expanded(
                                              child: DropdownButton(
                                            hint: Text("Select Sizes"),
                                            items: CreateProductCubit.get(
                                                    context)
                                                .getSizesModel
                                                .sizes!
                                                .map((e) => DropdownMenuItem(
                                                      child: Text('${e.size}'),
                                                      value: e.id,
                                                    ))
                                                .toList(),
                                            onChanged: (val) {
                                              setState(() {
                                                selectedSize = val!;
                                               // Variants[1][2] =val!;
                                                //print('$selectedSize');
                                              });
                                            },
                                            value: selectedSize,
                                          )),
                                          SizedBox(
                                            width: 15,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 80,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              controller: tag_1Controller,
                                              onFieldSubmitted: (value) {},
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "Tag One must not be empty";
                                                }
                                                tagList
                                                    .add(tag_1Controller.text);
                                                return null;
                                              },
                                              decoration: InputDecoration(
                                                labelText: "Tag one ",
                                                prefixIcon: Icon(Icons.tag),
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Expanded(
                                            child: TextFormField(
                                              controller: tag_2Controller,
                                              onFieldSubmitted: (value) {},
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "Tag Two must not be empty";
                                                }
                                                tagList
                                                    .add(tag_2Controller.text);
                                                return null;
                                              },
                                              decoration: InputDecoration(
                                                labelText: "Tag Two ",
                                                prefixIcon: Icon(Icons.tag),
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Expanded(
                                            child: TextFormField(
                                              controller: tag_3Controller,
                                              onFieldSubmitted: (value) {},
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "Tag Three must not be empty";
                                                }
                                                tagList
                                                    .add(tag_3Controller.text);
                                                return null;
                                              },
                                              decoration: InputDecoration(
                                                labelText: "Tag Three ",
                                                prefixIcon: Icon(Icons.tag),
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 80,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          // Expanded(
                                          //   child: TextFormField(
                                          //     controller:
                                          //         priceProductController,
                                          //     onFieldSubmitted: (value) {},
                                          //     validator: (value) {
                                          //       if (value!.isEmpty) {
                                          //         return "Product Price must not be empty";
                                          //       }
                                          //       return null;
                                          //     },
                                          //     decoration: InputDecoration(
                                          //       labelText: "Product Price ",
                                          //       prefixIcon:
                                          //           Icon(Icons.attach_money),
                                          //       border: OutlineInputBorder(),
                                          //     ),
                                          //   ),
                                          // ),
                                          Expanded(
                                              child: TextFormField(
                                                controller:
                                                priceProductController,
                                                keyboardType: TextInputType.number,
                                                // Allow only numeric input
                                                onFieldSubmitted: (value) {},
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "Product Price must not be empty";
                                                  }
                                                  // Additional validation logic if needed for integers
                                                  int? intValue =
                                                  int.tryParse(value);
                                                  if (intValue == null) {
                                                    return "Please enter a valid integer";
                                                  }
                                                  price = intValue;
                                                  return null;
                                                },
                                                decoration: InputDecoration(
                                                  labelText: "Product Price",
                                                  prefixIcon:
                                                  Icon(Icons.attach_money),
                                                  border: OutlineInputBorder(),
                                                ),
                                              )),
                                          SizedBox(
                                            width: 15,
                                          ),

                                          // Expanded(
                                          //   child: TextFormField(
                                          //     controller:
                                          //         discountProductController,
                                          //     onFieldSubmitted: (value) {},
                                          //     validator: (value) {
                                          //       if (value!.isEmpty) {
                                          //         return "Product Discount must not be empty";
                                          //       }
                                          //       return null;
                                          //     },
                                          //     decoration: InputDecoration(
                                          //       labelText: "Product Discount ",
                                          //       prefixIcon: Icon(
                                          //           Icons.discount_outlined),
                                          //       border: OutlineInputBorder(),
                                          //     ),
                                          //   ),
                                          // ),
                                          Expanded(
                                              child: TextFormField(
                                            controller:
                                                discountProductController,
                                            keyboardType: TextInputType.number,
                                            // Allow only numeric input
                                            onFieldSubmitted: (value) {},
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return "Product Discount must not be empty";
                                              }
                                              // Additional validation logic if needed for integers
                                              int? intValue =
                                                  int.tryParse(value);
                                              if (intValue == null) {
                                                return "Please enter a valid integer";
                                              }
                                              discount = intValue;
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                              labelText: "Product Discount",
                                              prefixIcon:
                                                  Icon(Icons.discount_outlined),
                                              border: OutlineInputBorder(),
                                            ),
                                          )),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Expanded(
                                              child: TextFormField(
                                                controller:
                                                quantityProductController,
                                                keyboardType: TextInputType.number,
                                                // Allow only numeric input
                                                onFieldSubmitted: (value) {},
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "Product Quantity must not be empty";
                                                  }
                                                  // Additional validation logic if needed for integers
                                                  int? intValue =
                                                  int.tryParse(value);
                                                  if (intValue == null) {
                                                    return "Please enter a valid integer";
                                                  }
                                                  count = intValue;
                                                  Variants[0][2] =intValue;
                                                  return null;
                                                },
                                                decoration: InputDecoration(
                                                  labelText: "Product Quantity",
                                                  prefixIcon:
                                                  Icon(Icons.production_quantity_limits_outlined),
                                                  border: OutlineInputBorder(),
                                                ),
                                              )),
                                          // Expanded(
                                          //   child: TextFormField(
                                          //     controller:
                                          //         quantityProductController,
                                          //     onFieldSubmitted: (value) {},
                                          //     validator: (value) {
                                          //       if (value!.isEmpty) {
                                          //         return "Product Quantity must not be empty";
                                          //       }
                                          //       return null;
                                          //     },
                                          //     decoration: InputDecoration(
                                          //       labelText: "Product Quantity ",
                                          //       prefixIcon: Icon(Icons
                                          //           .production_quantity_limits_outlined),
                                          //       border: OutlineInputBorder(),
                                          //     ),
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      controller: descriptionProductController,
                                      onFieldSubmitted: (value) {},
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Product Description must not be empty";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        labelText: "Product Description ",
                                        prefixIcon:
                                            Icon(Icons.description_outlined),
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Center(
                                      child: defaultCreatebuttom(
                                        //خالد هو خجي ب
                                          height: 60,
                                          width: 240,
                                          label: 'Add New Product',
                                          onTap: () {
                                            Variants[0][0] =selectedColor;
                                            Variants[0][1] =selectedSize;
                                            VariantMap[0]['color_id'] = selectedColor.toString();
                                            VariantMap[0]['size_id'] = selectedSize.toString();
                                            VariantMap[0]['variant_quantity'] = quantityProductController.text;

                                            // twoDArray[rowIndex][columnIndex] =
                                            //     42;
                                            if (formKey.currentState!
                                                .validate()) {
                                              CreateProductCubit.get(context).CreateProduct(
                                                ProductName: nameProductController.text , ProductPrice: price , ProductDescription: descriptionProductController
                                                  .text, ProductTag: tagList ,ProductVariants: VariantMap,ProductDiscount: discount,Cate: selectedSubcategory);
                                              print(nameProductController.text);
                                              print('$selectedSubcategory');
                                              print(tagList);
                                              print(Variants);
                                              print (price);
                                              print(discount);
                                              print(descriptionProductController
                                                  .text);
                                              print(VariantMap);
                                              //print(count);
                                             // print(count.runtimeType);
                                            }
                                          }),
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
            } else if (state is GetCategoryNameLoadingState || state is GetColorsLoadingState || state is GetSizesLoadingState || state is CreateProductLoadingState || state is CreateProductInitialState || state is LastLoadingState )
              return Stack(
                children: [
                  // Positioned.fill(
                  //   child: Image.asset(
                  //     'assets/images/background3.png',
                  //     fit: BoxFit.cover,
                  //   ),
                  // ),
                  Center(child: CircularProgressIndicator()),
                ],
              );
            else
              return Container();
          },
        ));
  }
}
