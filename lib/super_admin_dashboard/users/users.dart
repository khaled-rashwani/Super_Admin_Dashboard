// import 'package:flutter/material.dart';
// import '../shared/components/components.dart';
// import '../../project_shared/constants.dart';
//
//
// class UsersScreen extends StatelessWidget {
//   const UsersScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Container(
//                 alignment: Alignment.bottomLeft,
//                 height: 100,
//                 child: Text('Total Users : 105',style: TextStyle(fontWeight: FontWeight.w300,color: Colors.grey),),
//               ),
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
//                           'User Name',
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
//                           'Phone Number',
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
//                           'Wallet',
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
//                           'Email',
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
//                                 'Ahmad zeytoun',
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
//                                 '0939483944',
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
//                                 '5000',
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
//                                 'Ahmad.zeytoun@gmail.com',
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                               ),
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
