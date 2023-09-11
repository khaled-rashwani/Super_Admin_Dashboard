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

class CreateVariantsScreen2 extends StatefulWidget {
  @override
  State<CreateVariantsScreen2> createState() =>
      _CreateVariantsScreen2State();
}

class _CreateVariantsScreen2State extends State<CreateVariantsScreen2> {
  var quantityProductController = TextEditingController();
  var count;
  var selectedColor;
  var selectedSize;
  var selectedProduct;
  var formKey = GlobalKey<FormState>();
  List<List<int>> Variants =
  List.generate(1, (index) => List<int>.filled(3, 0));


  List<Map<String, String>> VariantMap = [
    {
      'color_id': '',
      'size_id': '',
      'variant_quantity': '',
    },
  ];
  get nameProductController => null;

  get descriptionProductController => null;

  @override
  Widget build(BuildContext context) {
    return   BlocProvider(
        create: (context) => VariantsCubit()..getVariantsData(),
        child: BlocConsumer<VariantsCubit, VariantsStates>(
          listener: (context, state) {
            if(state is AddVariantsSuccessState){
              Fluttertoast.showToast(
                  msg: "Variants Added successfully",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            }
            else if(state is AddVariantsErrorState){
              Fluttertoast.showToast(
                  msg:"Variants was not Added successfully" ,
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
            if ( state is LastVariantsSuccessState || state is AddVariantsSuccessState ) {
              return  Scaffold(
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
                                            "Add new Varaints",
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
                                      child: DropdownButton(
                                        hint: Text("Select Product Name"),
                                        items: VariantsCubit.get(
                                            context)
                                            .productNameModel
                                            .products!
                                            .map((e) => DropdownMenuItem(
                                          value: e.id,
                                          child: Text('${e.name}'),
                                        ))
                                            .toList(),
                                        onChanged: (val) {
                                          setState(() {
                                            selectedProduct = val!;

                                          });
                                        },
                                        value: selectedProduct,
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
                                            items: VariantsCubit.get(
                                                context)
                                                .getColorsVariantsModel
                                                .colors!
                                                .map((e) => DropdownMenuItem(
                                              value: e.id,
                                              child: Text('${e.color}'),
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
                                          ),),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Expanded(
                                              child:DropdownButton(
                                                hint: Text("Select Sizes"),
                                                items: VariantsCubit.get(
                                                    context)
                                                    .getSizesVariantsModel
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
                                              ),),
                                        ],
                                      ),
                                    ),

                                    SizedBox(
                                      height: 15,
                                    ),

                                    TextFormField(
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
                                        return null;
                                      },
                                      decoration: const InputDecoration(
                                        labelText: "Product Quantity",
                                        prefixIcon:
                                        Icon(Icons.production_quantity_limits_outlined),
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Center(
                                      child: defaultCreatebuttom(
                                          height: 60,
                                          width: 240,
                                          label: 'Add New Variant',
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
    VariantsCubit.get(context).AddVar(ProductVariants: VariantMap, id: selectedProduct);
                                          }}),
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
            } else if (state is LastVariantsLoadingState  || state is VariantsInitialState || state is AddVariantsLoadingState )
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
