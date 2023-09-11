// import 'package:flutter/material.dart';
// import 'package:super_admin_dashboard/admin_dashboard/variants/variantsScreen.dart';
// import '../../project_shared/constants.dart';
// import '../../super_admin_dashboard/shared/components/components.dart';
// import '../admin_create_product/create_product_screen.dart';
//
// class AdminProductsScreen extends StatelessWidget {
//   const AdminProductsScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(30.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             height: 50,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 alignment: Alignment.center,
//                 height: 100,
//                 child: Text(
//                   '     Total Products : 105',
//                   style: TextStyle(
//                       fontWeight: FontWeight.w300, color: Colors.grey),
//                 ),
//               ),
//               Container (
//                 width: 320,
//                 height: 100,
//                 //color: Colors.green,
//                 child: Row(
//                   children: [
//                     defaultCreatebuttom(label: 'Add new Variants', onTap: () {
//                       navigateTo(context, CreateVariantsScreen());
//                     }),
//                     defaultCreatebuttom(label: 'Create New Product', onTap: () {
//                       navigateTo(context, CreateProductScreen());
//                     }),
//
//                   ],
//                 ),
//               ),
//               // defaultCreatebuttom(label: 'Create New Product', onTap: () {
//               //   navigateTo(context, CreateProductScreen());
//               // }),
//               // defaultCreatebuttom(label: 'Create New Product', onTap: () {
//               //   navigateTo(context, CreateProductScreen());
//               // }),
//             ],
//           ),
//           Container(
//             height: 80,
//             width: double.infinity,
//             decoration: const BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.circular(15))),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Flexible(
//                       flex: 1,
//                       child: Container(
//                           alignment: Alignment.center,
//                           width: 130,
//                           child: Text(
//                             '#ID',
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                           ))),
//                   Flexible(
//                       flex: 1,
//                       child: Container(
//                         alignment: Alignment.center,
//                         width: 130,
//                         child: const Text(
//                           'Image',
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       )),
//                   Flexible(
//                       flex: 1,
//                       child: Container(
//                         alignment: Alignment.center,
//                         width: 130,
//                         child: const Text(
//                           'Category Name',
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       )),
//                   Flexible(
//                       flex: 1,
//                       child: Container(
//                         alignment: Alignment.center,
//                         width: 180,
//                         child: const Text(
//                           'SubCategories Name',
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       )),
//                   Flexible(
//                       flex: 1,
//                       child: Container(
//                         alignment: Alignment.center,
//                         width: 130,
//                         child: const Text(
//                           'Price',
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       )),
//                   Flexible(
//                       flex: 1,
//                       child: Container(
//                         alignment: Alignment.center,
//                         width: 130,
//                         child: const Text(
//                           'Discount price',
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       )),
//                   Flexible(
//                       flex: 1,
//                       child: Container(
//                         alignment: Alignment.center,
//                         width: 130,
//                         child: const Text(
//                           'Actions',
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       )),
//                   SizedBox(),
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.separated(
//               itemBuilder: (context, index) {
//                 return Container(
//                   height: 80,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                       color: myLightBG,
//                       borderRadius: BorderRadius.all(Radius.circular(15))),
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Flexible(
//                             flex: 1,
//                             child: Container(
//                                 alignment: Alignment.center,
//                                 width: 130,
//                                 child: Text(
//                                   '#$index',
//                                   maxLines: 1,
//                                   overflow: TextOverflow.ellipsis,
//                                 ))),
//                         Flexible(
//                             flex: 1,
//                             child: Container(
//                               alignment: Alignment.center,
//                               width: 130,
//                               child: Image.asset(
//                                 'assets/images/logo.png',
//                                 width: 55,
//                               ),
//                             )),
//                         Flexible(
//                             flex: 1,
//                             child: Container(
//                               alignment: Alignment.center,
//                               width: 130,
//                               child: Text(
//                                 'Men',
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                             )),
//                         Flexible(
//                             flex: 1,
//                             child: Container(
//                               alignment: Alignment.center,
//                               width: 180,
//                               child: Text(
//                                 'T-shirt',
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                             )),
//                         Flexible(
//                             flex: 1,
//                             child: Container(
//                               alignment: Alignment.center,
//                               width: 130,
//                               child: Text(
//                                 '1250',
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                             )),
//                         Flexible(
//                             flex: 1,
//                             child: Container(
//                               alignment: Alignment.center,
//                               width: 130,
//                               child: Text(
//                                 '999',
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                             )),
//                         Flexible(
//                             flex: 1,
//                             child: Container(
//                                 alignment: Alignment.center,
//                                 width: 130,
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     IconButton(onPressed: () {},
//                                         icon: Icon(
//                                           Icons.edit, color: Colors.grey,)),
//                                     SizedBox(width: 20,),
//                                     IconButton(onPressed: () {},
//                                         icon: Icon(
//                                           Icons.delete, color: Colors.red,)),
//                                   ],
//                                 )
//                             )),
//                         SizedBox(),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//               itemCount: 10,
//               separatorBuilder: (BuildContext context, int index) {
//                 return SizedBox(
//                   height: 10,
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
