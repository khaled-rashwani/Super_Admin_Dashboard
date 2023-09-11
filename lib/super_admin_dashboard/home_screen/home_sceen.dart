// import 'package:flutter/material.dart';
// import '../shared/components/components.dart';
// import '../shared/components/graph.dart';
// import '../../project_shared/constants.dart';
// import '../../project_shared/responsive.dart';
//
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: const EdgeInsets.only(top: 70),
//         child: Row(
//           children: [
//             Expanded(
//                 flex: 4,
//                 child: Padding(
//                   padding: const EdgeInsets.all(defaultPadding),
//                   child: Column(
//                     children: [
//                       Container(
//                         width: double.infinity,
//                         height: 40,
//                         child: Text(
//                           "Details:",
//                           style: TextStyle(fontSize: 20, color: Colors.white),
//                         ),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Expanded(
//                             child: MyCard(
//                                 text: "Total Users:",
//                                 icon: Icons.person,
//                                 Num: "2,000,000"),
//                           ),
//                           SizedBox(
//                             width: 20,
//                             height: 20,
//                           ),
//                           Expanded(
//                             child: MyCard(
//                                 text: "Total Admins :",
//                                 icon: Icons.group,
//                                 Num: "4,000,000"),
//                           ),
//                           SizedBox(
//                             width: 20,
//                             height: 20,
//                           ),
//                           if (Responsive.isCard(context))
//                             Expanded(
//                               child: MyCard(
//                                   text: "Total Orders:",
//                                   icon: Icons.shopping_cart,
//                                   Num: "6,000,000"),
//                             ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 17,
//                       ),
//                       Divider(
//                         thickness: 2,
//                         height: 20,
//                       ),
//                       Container(
//                         width: double.infinity,
//                         height: 40,
//                         child: Text(
//                           "Best Selling:",
//                           style: TextStyle(fontSize: 20, color: Colors.white),
//                         ),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Flexible(
//                               flex: 1,
//                               child: Container(
//                                   alignment: Alignment.center,
//                                   width: 130,
//                                   child: Text(
//                                     '#ID',
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                   ))),
//                           Flexible(
//                               flex: 1,
//                               child: Container(
//                                 alignment: Alignment.center,
//                                 width: 130,
//                                 child: const Text(
//                                   'Image',
//                                   maxLines: 1,
//                                   overflow: TextOverflow.ellipsis,
//                                 ),
//                               )),
//                           Flexible(
//                               flex: 1,
//                               child: Container(
//                                 alignment: Alignment.center,
//                                 width: 130,
//                                 child: const Text(
//                                   'Product Name',
//                                   maxLines: 1,
//                                   overflow: TextOverflow.ellipsis,
//                                 ),
//                               )),
//                           Flexible(
//                               flex: 1,
//                               child: Container(
//                                 alignment: Alignment.center,
//                                 width: 130,
//                                 child: const Text(
//                                   'Vendor Name',
//                                   maxLines: 1,
//                                   overflow: TextOverflow.ellipsis,
//                                 ),
//                               )),
//                           Flexible(
//                               flex: 1,
//                               child: Container(
//                                 alignment: Alignment.center,
//                                 width: 130,
//                                 child: const Text(
//                                   'Category',
//                                   maxLines: 1,
//                                   overflow: TextOverflow.ellipsis,
//                                 ),
//                               )),
//                           Flexible(
//                               flex: 1,
//                               child: Container(
//                                 alignment: Alignment.center,
//                                 width: 130,
//                                 child: const Text(
//                                   'Price',
//                                   maxLines: 1,
//                                   overflow: TextOverflow.ellipsis,
//                                 ),
//                               )),
//                           Flexible(
//                               flex: 1,
//                               child: Container(
//                                 alignment: Alignment.center,
//                                 width: 130,
//                                 child: const Text(
//                                   'Discount price',
//                                   maxLines: 1,
//                                   overflow: TextOverflow.ellipsis,
//                                 ),
//                               )),
//                           SizedBox(),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Expanded(
//                         child: Container(
//                           width: 800,
//                           height: 300,
//                           child: ListView.separated(
//                             itemBuilder: (context, index) {
//                               return Container(
//                                 height: 80,
//                                 width: double.infinity,
//                                 decoration: BoxDecoration(
//                                     color: myLightBG,
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(15))),
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(2.0),
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     children: [
//                                       Flexible(
//                                           flex: 1,
//                                           child: Container(
//                                               alignment: Alignment.center,
//                                               width: 120,
//                                               child: Text(
//                                                 '#$index',
//                                                 maxLines: 1,
//                                                 overflow: TextOverflow.ellipsis,
//                                               ))),
//                                       Flexible(
//                                           flex: 1,
//                                           child: Container(
//                                             alignment: Alignment.center,
//                                             width: 120,
//                                             child: Image.asset(
//                                               'assets/images/logo.png',
//                                               width: 55,
//                                             ),
//                                           )),
//                                       Flexible(
//                                           flex: 1,
//                                           child: Container(
//                                             alignment: Alignment.center,
//                                             width: 120,
//                                             child: Text(
//                                               'T-shirt',
//                                               maxLines: 1,
//                                               overflow: TextOverflow.ellipsis,
//                                             ),
//                                           )),
//                                       Flexible(
//                                           flex: 1,
//                                           child: Container(
//                                             alignment: Alignment.center,
//                                             width: 120,
//                                             child: Text(
//                                               'Adidas',
//                                               maxLines: 1,
//                                               overflow: TextOverflow.ellipsis,
//                                             ),
//                                           )),
//                                       Flexible(
//                                           flex: 1,
//                                           child: Container(
//                                             alignment: Alignment.center,
//                                             width: 120,
//                                             child: Text(
//                                               'Clothes',
//                                               maxLines: 1,
//                                               overflow: TextOverflow.ellipsis,
//                                             ),
//                                           )),
//                                       Flexible(
//                                           flex: 1,
//                                           child: Container(
//                                             alignment: Alignment.center,
//                                             width: 120,
//                                             child: Text(
//                                               '1250',
//                                               maxLines: 1,
//                                               overflow: TextOverflow.ellipsis,
//                                             ),
//                                           )),
//                                       Flexible(
//                                           flex: 1,
//                                           child: Container(
//                                             alignment: Alignment.center,
//                                             width: 120,
//                                             child: Text(
//                                               '999',
//                                               maxLines: 1,
//                                               overflow: TextOverflow.ellipsis,
//                                             ),
//                                           )),
//                                       SizedBox(),
//                                     ],
//                                   ),
//                                 ),
//                               );
//                             },
//                             itemCount: 10,
//                             separatorBuilder:
//                                 (BuildContext context, int index) {
//                               return SizedBox(
//                                 height: 10,
//                               );
//                             },
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 )),
//             if (Responsive.isDesktop(context))
//               Expanded(
//                   flex: 2,
//                   child: Stack(
//                     children: [
//                       Container(
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(30),
//                           color: myLightBG,
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.all(20),
//                               child: Container(
//                                 width: 300,
//                                 height: 300,
//                                 // color: Colors.green,
//                                 child: Graph(),
//                               ),
//                             ),
//                             Container(
//                               width: 300,
//                               height: 300,
//                               //color: Colors.red,
//                               child: GraphInfo(),
//                             )
//                           ],
//                         ),
//                       ),
//                       // Container(
//                       //   color: Colors.blue,
//                       //   width: double.infinity,
//                       //   child: Column(
//                       //     crossAxisAlignment: CrossAxisAlignment.center,
//                       //     children: [
//                       //       Container(
//                       //         width: 200,
//                       //         height: 200,
//                       //         color: Colors.red,
//                       //       ),
//                       //     ],
//                       //   ),
//                       // )
//                     ],
//                   )),
//           ],
//         ));
//   }
// }
