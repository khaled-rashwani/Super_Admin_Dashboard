// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import '../../admin_dashboard/admin_create_product/model.dart';
// import 'package:flutter/src/material/colors.dart';
// import 'package:flutter/material.dart';
//
// import '../../project_shared/constants.dart';
// import '../shared/components/components.dart';
//
// class ProductPropertiesScreen2 extends StatefulWidget {
//   const ProductPropertiesScreen2({Key? key}) : super(key: key);
//
//   @override
//   State<ProductPropertiesScreen2> createState() => _ProductPropertiesScreen2State();
// }
//
// class _ProductPropertiesScreen2State extends State<ProductPropertiesScreen2> {
//   var colorNameController = TextEditingController();
//   var colorCodeController = TextEditingController();
//   var tShirtSizeController = TextEditingController();
//   var shoesSizeController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 130,left: 50,right: 50),
//       child: Container(
//         color:myDarkBG,
//         width: double.infinity,
//         height: 400,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Container(
//               width: 330,
//               height: 440,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                       child: Image.asset(
//                         'assets/images/color.png',
//                         width: 200,
//                         height: 200,
//                       )),
//                   Container(
//
//                     child: TextFormField(
//                       controller: colorNameController,
//                       onFieldSubmitted: (value) {},
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return "Color Name must not be empty";
//                         }
//                         return null;
//                       },
//                       decoration: InputDecoration(
//                         labelText: "Color Name",
//                         prefixIcon: Icon(Icons.color_lens),
//                         border: OutlineInputBorder(),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     child: TextFormField(
//                       controller: colorCodeController,
//                       onFieldSubmitted: (value) {},
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return "Color Code must not be empty";
//                         }
//                         return null;
//                       },
//                       decoration: InputDecoration(
//                         labelText: "Color Code",
//                         prefixIcon: Icon(Icons.qr_code_scanner_rounded),
//                         border: OutlineInputBorder(),
//                       ),
//                     ),
//                   ),
//                   Container(
//                       height: 65,
//                       width: 180,
//                       child: defaultCreatebuttom(
//                           height: 60,
//                           width: 180,
//                           label: "Create Color",
//                           onTap: () {})),
//                 ],
//
//               ),
//             ),
//             Container(
//               width: 330,
//               height: 440,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                       child: Image.asset(
//                         'assets/images/tshirt.png',
//                         width: 200,
//                         height: 200,
//                       )),
//                   Container(
//                     child: TextFormField(
//                       controller: tShirtSizeController,
//                       onFieldSubmitted: (value) {},
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return "T-Shirt Size must not be empty";
//                         }
//                         return null;
//                       },
//                       decoration: InputDecoration(
//                         labelText: "T-Shirt Size",
//                         prefixIcon: Icon(Icons.checkroom),
//                         border: OutlineInputBorder(),
//                       ),
//                     ),
//                   ),
//                   Container(
//                       height: 65,
//                       width: 180,
//                       child: defaultCreatebuttom(
//                           height: 60,
//                           width: 180,
//                           label: "Create T-Shirt Size",
//                           onTap: () {})),
//                 ],
//               ),
//             ),
//             Container(
//               width: 330,
//               height: 440,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     child: Image.asset(
//                       'assets/images/shoes.png',
//                       width: 200,
//                       height: 200,
//                     ),
//                   ),
//                   Container(
//                     child: TextFormField(
//                       controller: shoesSizeController,
//                       onFieldSubmitted: (value) {},
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return "Shoes Size must not be empty";
//                         }
//                         return null;
//                       },
//                       decoration: InputDecoration(
//                         labelText: "Shoes Size",
//                         prefixIcon: Icon(Icons.square_foot),
//                         border: OutlineInputBorder(),
//                       ),
//                     ),
//                   ),
//                   Container(
//                       height: 65,
//                       width: 180,
//                       child: defaultCreatebuttom(
//                           height: 60,
//                           width: 180,
//                           label: "Create Shoes Size",
//                           onTap: () {}))
//                 ],
//               ),
//             ),
//           ],
//         ),
//       )
//     );
//   }
// }
