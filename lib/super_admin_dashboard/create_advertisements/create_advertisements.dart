// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../shared/components/components.dart';
// import '../../project_shared/constants.dart';
//
//
// class CreateAdvertisementsScreen extends StatefulWidget {
//   @override
//   State<CreateAdvertisementsScreen> createState() =>
//       _CreateAdvertisementsScreenState();
// }
//
// class _CreateAdvertisementsScreenState
//     extends State<CreateAdvertisementsScreen> {
//   var selectedCompany;
//
//   var selectedProduct;
//
//   var selectedSubcategory;
//
//   var selectedCategory;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: myDarkBG,
//           elevation: 0,
//         ),
//         body: Stack(
//           children: [
// // Background image
//             Positioned.fill(
//               child: Image.asset(
//                 'assets/images/background3.png',
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Center(
//               child: Container(
//                 width: 700,
//                 height: double.infinity,
//                 child: Padding(
//                   padding: const EdgeInsets.all(15),
//                   child: SingleChildScrollView(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           child: Text(
//                             "We've welcomed a new company to our community",
//                             style: TextStyle(fontSize: 10, color: Colors.grey),
//                           ),
//                         ),
//                         Row(
//                           children: [
//                             Container(
//                               child: Text(
//                                 "Create new advertisement",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold, fontSize: 35),
//                               ),
//                             ),
//                             SizedBox(
//                               width: 2,
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(top: 17),
//                               child: Container(
//                                 width: 8,
//                                 height: 8,
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: primaryColor,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Container(
//                           width: double.infinity,
//                           height: 200,
//                           child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 InkWell(
//                                   onTap: () {},
//                                   child: DottedBorder(
//                                     color: Colors.grey,
//                                     strokeWidth: 5,
//                                     dashPattern: [16, 16, 16, 16],
//                                     child: Container(
//                                       width: 200,
//                                       height: 200,
//                                       child: Icon(
//                                         Icons.add,
//                                         color: Colors.grey,
//                                         size: 60,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ]),
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Container(
//                           width: double.infinity,
//                           child: DropdownButton(
//                             hint: Text(
//                               "Select Company",
//                             ),
//                             items:
//                                 ["Adidas", "Nike", "Louis Vuitton", "Versace"]
//                                     .map((e) => DropdownMenuItem(
//                                           child: Text("$e"),
//                                           value: e,
//                                         ))
//                                     .toList(),
//                             onChanged: (val) {
//                               setState(() {
//                                  selectedCompany = val!;
//                               });
//                             },
//                             value: selectedCompany,
//                           ),
//                         ),
//                         Container(
//                           width: double.infinity,
//                           height: 80,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Expanded(
//                                   child: DropdownButton(
//                                 hint: Text("Select Category"),
//                                 items: [
//                                   "Women's Clothing",
//                                   "Men clothes",
//                                   "Teen clothes",
//                                   "children clothes"
//                                 ]
//                                     .map((e) => DropdownMenuItem(
// // child: Text("$e Company"),
//                                           child: Text("$e"),
//                                           value: e,
//                                         ))
//                                     .toList(),
//                                 onChanged: (val) {
//                                   setState(() {
//                                     selectedCategory = val!;
//                                   });
//                                 },
//                                 value: selectedCategory,
//                               )),
//                               SizedBox(
//                                 width: 15,
//                               ),
//                               Expanded(
//                                   child: DropdownButton(
//                                 hint: Text("Select Subcategory"),
//                                 items: ["Sweaters", "Shoes", "Jeans", "Glasses"]
//                                     .map((e) => DropdownMenuItem(
// // child: Text("$e Company"),
//                                           child: Text("$e"),
//                                           value: e,
//                                         ))
//                                     .toList(),
//                                 onChanged: (val) {
//                                   setState(() {
//                                     selectedSubcategory = val!;
//                                   });
//                                 },
//                                 value: selectedSubcategory,
//                               )),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: 15,
//                         ),
//                         Container(
//                           width: double.infinity,
//                           child: DropdownButton(
//                             hint: Text("Select Product"),
//                             items: [
//                               "Blue sweater",
//                               "Red sweater",
//                               "Green sweater",
//                               "Yellow sweater"
//                             ]
//                                 .map((e) => DropdownMenuItem(
// // child: Text("$e Company"),
//                                       child: Text("$e"),
//                                       value: e,
//                                     ))
//                                 .toList(),
//                             onChanged: (val) {
//                               setState(() {
//                                 selectedProduct = val!;
//                               });
//                             },
//                             value: selectedProduct,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Center(
//                           child: defaultCreatebuttom(
//                               height: 60,
//                               width: 240,
//                               label: 'Create New Advertisement',
//                               onTap: () {
//                                 print('$selectedCompany');
//                                 print('$selectedCategory');
//                                 print('$selectedSubcategory');
//                                 print('$selectedProduct');
//                                 print("Advertisement");
//                               }),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ));
//   }
// }
//
