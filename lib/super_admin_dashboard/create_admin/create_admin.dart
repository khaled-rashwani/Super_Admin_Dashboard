// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import '../shared/components/components.dart';
// import '../../project_shared/constants.dart';
//
// class CreateAdminScreen extends StatefulWidget {
//   @override
//   State<CreateAdminScreen> createState() => _CreateAdminScreenState();
// }
//
// class _CreateAdminScreenState extends State<CreateAdminScreen> {
//   var companyNameController = TextEditingController();
//
//   var phoneNumberController = TextEditingController();
//
//   var addressController = TextEditingController();
//
//   var emailController = TextEditingController();
//
//   var passwordController = TextEditingController();
//
//   var passwordConfirmationController = TextEditingController();
//
//   var percentageController = TextEditingController();
//
//   var descroptionController =TextEditingController();
//
//
//   bool isPassword = true;
//
//   var formKey = GlobalKey<FormState>();
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
//             // Background image
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
//                     child: Form(
//                       key: formKey,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             child: Text(
//                               "We've welcomed a new company to our community",
//                               style:
//                                   TextStyle(fontSize: 10, color: Colors.grey),
//                             ),
//                           ),
//                           Row(
//                             children: [
//                               Container(
//                                 child: Text(
//                                   "Create new account",
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 35),
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 2,
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(top: 17),
//                                 child: Container(
//                                   width: 8,
//                                   height: 8,
//                                   decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     color: primaryColor,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           Container(
//                             width: double.infinity,
//                             height: 200,
//                             child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                   InkWell(
//                                     onTap: () {},
//                                     child: DottedBorder(
//                                       color: Colors.grey,
//                                       strokeWidth: 5,
//                                       dashPattern: [16, 16, 16, 16],
//                                       //radius: Radius.circular(12),
//                                       child: Container(
//                                         width: 200,
//                                         height: 200,
//                                         child: Icon(
//                                           Icons.add,
//                                           color: Colors.grey,
//                                           size: 60,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ]),
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           Container(
//                             width: double.infinity,
//                             height: 80,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Expanded(
//                                   child: TextFormField(
//                                     controller: companyNameController,
//                                     onFieldSubmitted: (value) {},
//                                     validator: (value) {
//                                       if (value!.isEmpty) {
//                                         return "Company Name must not be empty";
//                                       }
//                                       return null;
//                                     },
//                                     decoration: InputDecoration(
//                                       labelText: "Company Name",
//
//                                         prefixIcon: Icon(
//                                           Icons.location_city, // Set the prefix icon color to yellow
//                                         ),
//                                       border: OutlineInputBorder(),
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: 15,
//                                 ),
//                                 Expanded(
//                                   child: TextFormField(
//                                     controller: phoneNumberController,
//                                     onFieldSubmitted: (value) {},
//                                     validator: (value) {
//                                       if (value!.isEmpty) {
//                                         return "Phone Number must not be empty";
//                                       }
//                                       return null;
//                                     },
//                                     decoration: InputDecoration(
//                                       labelText: "Phone Number",
//                                       prefixIcon:
//                                           Icon(Icons.phone_android_outlined),
//                                       border: OutlineInputBorder(),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//
//                           SizedBox(
//                             height: 15,
//                           ),
//                           TextFormField(
//                             controller: emailController,
//                             onFieldSubmitted: (value) {},
//                             validator: (value) {
//                               if (value!.isEmpty) {
//                                 return "Email Address must not be empty";
//                               }
//                               return null;
//                             },
//                             decoration: InputDecoration(
//                               labelText: "Email Address",
//                               prefixIcon: Icon(Icons.email_outlined),
//                               border: OutlineInputBorder(),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 15,
//                           ),
//                           Container(
//                             width: double.infinity,
//                             height: 80,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Expanded(
//                                   child:    TextFormField(
//                                     controller: passwordController,
//                                     keyboardType: TextInputType.visiblePassword,
//                                     obscureText: isPassword,
//                                     onFieldSubmitted: (value) {},
//                                     validator: (value) {
//                                       if (value!.isEmpty) {
//                                         return "Password must not be empty";
//                                       }
//                                       return null;
//                                     },
//                                     decoration: InputDecoration(
//                                       labelText: "Password",
//                                       suffix: InkWell(
//                                         onTap: () {
//                                           setState(() {
//                                             isPassword = !isPassword;
//                                           });
//                                         },
//                                         child: isPassword
//                                             ? Icon(Icons.visibility)
//                                             : Icon(Icons.visibility_off),
//                                       ),
//                                       suffixIconConstraints: BoxConstraints(
//                                         minWidth: 2,
//                                         minHeight: 2,
//                                       ),
//                                       prefixIcon: Icon(Icons.lock_outline),
//                                       border: OutlineInputBorder(),
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: 15,
//                                 ),
//                                 Expanded(
//                                   child:    TextFormField(
//                                     controller: passwordConfirmationController,
//                                     keyboardType: TextInputType.visiblePassword,
//                                     obscureText: isPassword,
//                                     onFieldSubmitted: (value) {},
//                                     validator: (value) {
//                                       if (value!.isEmpty) {
//                                         return "Password Confirmation must not be empty";
//                                       }
//                                       return null;
//                                     },
//                                     decoration: InputDecoration(
//                                       labelText: "Password",
//                                       suffix: InkWell(
//                                         onTap: () {
//                                           setState(() {
//                                             isPassword = !isPassword;
//                                           });
//                                         },
//                                         child: isPassword
//                                             ? Icon(Icons.visibility)
//                                             : Icon(Icons.visibility_off),
//                                       ),
//                                       suffixIconConstraints: BoxConstraints(
//                                         minWidth: 2,
//                                         minHeight: 2,
//                                       ),
//                                       prefixIcon: Icon(Icons.lock_outline),
//                                       border: OutlineInputBorder(),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(
//                             height: 15,
//                           ),
//                           TextFormField(
//                             controller: addressController,
//                             onFieldSubmitted: (value) {},
//                             validator: (value) {
//                               if (value!.isEmpty) {
//                                 return "Address must not be empty";
//                               }
//                               return null;
//                             },
//                             decoration: InputDecoration(
//                               labelText: "Address",
//                               prefixIcon: Icon(Icons.location_on_outlined),
//                               border: OutlineInputBorder(),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           TextFormField(
//                             controller: descroptionController,
//                             onFieldSubmitted: (value) {},
//                             validator: (value) {
//                               if (value!.isEmpty) {
//                                 return "Descroption must not be empty";
//                               }
//                               return null;
//                             },
//                             decoration: InputDecoration(
//                               labelText: "Descroption",
//                               prefixIcon: Icon(Icons.description_outlined),
//                               border: OutlineInputBorder(),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           TextFormField(
//                             controller: percentageController,
//                             onFieldSubmitted: (value) {},
//                             validator: (value) {
//                               if (value!.isEmpty) {
//                                 return "Percentage must not be empty";
//                               }
//                               return null;
//                             },
//                             decoration: InputDecoration(
//                               labelText: "Percentage",
//                               prefixIcon: Icon(Icons.percent_outlined),
//                               border: OutlineInputBorder(),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           Center(
//                             child: defaultCreatebuttom(
//                                 height: 60,
//                                 width: 180,
//                                 label: "Create Account",
//                                 onTap: () {
//                                   if (formKey.currentState!.validate()) {
//                                     print(companyNameController.text);
//                                     print(phoneNumberController.text);
//                                     print(emailController.text);
//                                     print(passwordController.text);
//                                     print(passwordConfirmationController.text);
//                                     print(addressController.text);
//                                     print(descroptionController.text);
//                                     print(percentageController.text);
//                                   }
//                                 }),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ));
//   }
// }
