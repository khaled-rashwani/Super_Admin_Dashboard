// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import '../../project_shared/constants.dart';
// import 'cubit/cubit.dart';
// import 'cubit/states.dart';
//
// class CreateVariantsScreen extends StatefulWidget {
//   @override
//   State<CreateVariantsScreen> createState() =>
//       _CreateVariantsScreenState();
// }
//
// class _CreateVariantsScreenState extends State<CreateVariantsScreen> {
//   var quantityProductController = TextEditingController();
//   var count;
//   var selectedColor;
//   var formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return   BlocProvider(
//         create: (context) => VariantsCubit()..getColors(),
//         child: BlocConsumer<VariantsCubit, VariantsStates>(
//           listener: (context, state) {
//             if(state is AddVariantsSuccessState){
//               Fluttertoast.showToast(
//                   msg: "Variants Added successfully",
//                   toastLength: Toast.LENGTH_SHORT,
//                   gravity: ToastGravity.CENTER,
//                   timeInSecForIosWeb: 5,
//                   backgroundColor: Colors.green,
//                   textColor: Colors.white,
//                   fontSize: 16.0
//               );
//             }
//             else if(state is AddVariantsErrorState){
//               Fluttertoast.showToast(
//                   msg:"Variants was not Added successfully" ,
//                   toastLength: Toast.LENGTH_SHORT,
//                   gravity: ToastGravity.CENTER,
//                   timeInSecForIosWeb: 5,
//                   backgroundColor: Colors.red,
//                   textColor: Colors.white,
//                   fontSize: 16.0
//               );
//             }
//           },
//           builder: (context, state) {
//             if (state is getColorSuccessState ) {
//               return  Scaffold(
//                   appBar: AppBar(
//                     backgroundColor: myDarkBG,
//                     elevation: 0,
//                   ),
//                   body: Stack(
//                     children: [
//                       // Positioned.fill(
//                       //   child: Image.asset(
//                       //     'assets/images/background3.png',
//                       //     fit: BoxFit.cover,
//                       //   ),
//                       // ),
//                       Center(
//                         child: Container(
//                           width: 700,
//                           height: double.infinity,
//                           child: Padding(
//                             padding: const EdgeInsets.all(15),
//                             child: Form(
//                               key: formKey,
//                               child: Center(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Container(
//                                       child: Text(
//                                         "We've welcomed a new company to our community",
//                                         style:
//                                         TextStyle(fontSize: 10, color: Colors.grey),
//                                       ),
//                                     ),
//                                     Row(
//                                       children: [
//                                         Container(
//                                           child: Text(
//                                             "Create new Subcategory",
//                                             style: TextStyle(
//                                                 fontWeight: FontWeight.bold,
//                                                 fontSize: 35),
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           width: 2,
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsets.only(top: 17),
//                                           child: Container(
//                                             width: 8,
//                                             height: 8,
//                                             decoration: BoxDecoration(
//                                               shape: BoxShape.circle,
//                                               color: primaryColor,
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     SizedBox(
//                                       height: 20,
//                                     ),
//                                     Container(
//                                       width: double.infinity,
//                                       height: 400,
//                                       child: Column(
//                                         children: [
//                                           Container(
//                                             width: double.infinity,
//                                             height: 50,
//                                             child: DropdownButton(
//                                               hint: Text("Select Color"),
//                                               items: VariantsCubit.get(
//                                                   context)
//                                                   .getColorsVariantsModel
//                                                   .colors!
//                                                   .map((e) => DropdownMenuItem(
//                                                 child: Text('${e.color}'),
//                                                 value: e.id,
//                                               ))
//                                                   .toList(),
//                                               onChanged: (val) {
//                                                 setState(() {
//                                                   selectedColor = val!;
//                                                   // Variants[1][1] =selectedColor;
//                                                   //print('$selectedColor');
//                                                 });
//                                               },
//                                               value: selectedColor,
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 10,
//                                           ),
//                                           Container(
//                                             height: 60,
//                                             width: 200,
//                                             child: Row(
//                                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                               children: [
//
//                                                 TextFormField(
//                                                   controller:
//                                                   quantityProductController,
//                                                   keyboardType: TextInputType.number,
//                                                   // Allow only numeric input
//                                                   onFieldSubmitted: (value) {},
//                                                   validator: (value) {
//                                                     if (value!.isEmpty) {
//                                                       return "Product Quantity must not be empty";
//                                                     }
//                                                     // Additional validation logic if needed for integers
//                                                     int? intValue =
//                                                     int.tryParse(value);
//                                                     if (intValue == null) {
//                                                       return "Please enter a valid integer";
//                                                     }
//                                                     count = intValue;
//                                                     return null;
//                                                   },
//                                                   decoration: InputDecoration(
//                                                     labelText: "Product Quantity",
//                                                     prefixIcon:
//                                                     Icon(Icons.production_quantity_limits_outlined),
//                                                     border: OutlineInputBorder(),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 10,
//                                           ),
//                                           // Container(
//                                           //     height: 60,
//                                           //     width: 180,
//                                           //     child: ConditionalBuilder(
//                                           //       condition: state is! CreateSubCategoriesLoadingState,
//                                           //       //condition: true,
//                                           //       builder: (context) =>defaultCreatebuttom(
//                                           //           height: 60,
//                                           //           width: 180,
//                                           //           label: "Create Sub Category",
//                                           //           onTap: () {
//                                           //             if (formKey.currentState!.validate()) {
//                                           //               CreateSubCategoriesCubit.get(context).CreateSubCategoris(
//                                           //                 CategoryName: subcategoryNameController.text, ParentId: selectedCategory,/*Image :CreateCategoriesCubit.get(context).k?.path.toString()*/);
//                                           //               //Dragon Context
//                                           //             }
//                                           //           }),
//                                           //       fallback: (context) =>Center(child: CircularProgressIndicator(),),
//                                           //     )
//                                           // ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       )
//                     ],
//                   ));
//             } else if (state is getColorLoadingState  || state is VariantsInitialState )
//               return Stack(
//                 children: [
//                   // Positioned.fill(
//                   //   child: Image.asset(
//                   //     'assets/images/background3.png',
//                   //     fit: BoxFit.cover,
//                   //   ),
//                   // ),
//                   Center(child: CircularProgressIndicator()),
//                 ],
//               );
//             else
//               return Container();
//
//           },
//         ));
//   }
// }
