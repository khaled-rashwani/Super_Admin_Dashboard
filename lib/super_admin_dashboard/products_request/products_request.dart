// import 'package:flutter/material.dart';
//
// import '../../project_shared/constants.dart';
//
// class ProductsRequestScreen extends StatelessWidget {
//   const ProductsRequestScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             alignment: Alignment.bottomLeft,
//             height: 100,
//             child: Text('Total Request : 22',style: TextStyle(fontWeight: FontWeight.w300,color: Colors.grey),),
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
//                           child: Text('#ID',maxLines: 1,
//                             overflow: TextOverflow.ellipsis,)
//                       )),
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
//                           'Product Name',
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
//                           'Vendor Name',
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
//                           'Category',
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
//                           'Accept \\ Reject',
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
//                                 child: Text('#$index',maxLines: 1,
//                                   overflow: TextOverflow.ellipsis,)
//                             )),
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
//                                 'T-shirt',
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//
//                               ),
//                             )),
//                         Flexible(
//                             flex: 1,
//                             child: Container(
//                               alignment: Alignment.center,
//                               width: 130,
//                               child: Text(
//                                 'Adidas',
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
//                                 'Clothes',
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
//                                     IconButton(onPressed: (){}, icon: Icon(Icons.check,color: Colors.green,)),
//                                     SizedBox(width: 20,),
//                                     IconButton(onPressed: (){}, icon: Icon(Icons.do_not_disturb_alt,color: Colors.red,)),
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
