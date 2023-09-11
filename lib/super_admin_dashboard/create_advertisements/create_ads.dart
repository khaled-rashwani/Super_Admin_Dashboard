import 'dart:typed_data';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../shared/components/components.dart';
import '../../project_shared/constants.dart';
import 'create_ads_cubit/cubit.dart';
import 'create_ads_cubit/states.dart';


class CreateAdsScreen extends StatefulWidget {
  @override
  State<CreateAdsScreen> createState() =>
      _CreateAdsScreenState();
}

class _CreateAdsScreenState extends State<CreateAdsScreen> {
  var selectedAdmin;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return   BlocProvider(
        create: (context) => CreateAdsCubit()..getAdminName(),
        child: BlocConsumer<CreateAdsCubit, CreateAdsStates>(
          listener: (context, state) {
            if(state is CreateAdsSuccessState){
              Fluttertoast.showToast(
                  msg: "Category created successfully",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            }
            else if(state is CreateAdsErrorState){
              Fluttertoast.showToast(
                  msg:"Category was not created successfully" ,
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
            if (state is getAdminNameSuccessState || state is CreateAdsSuccessState) {
              return  Scaffold(
                  appBar: AppBar(
                    backgroundColor: myDarkBG,
                    elevation: 0,
                  ),
                  body: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          'assets/images/background3.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Center(
                        child: Container(
                          width: 700,
                          height: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Form(
                              key: formKey,
                              child: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text(
                                        "We've welcomed a new company to our community",
                                        style:
                                        TextStyle(fontSize: 10, color: Colors.grey),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: Text(
                                            "Create new Advertisements",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 35),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 17),
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
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: 200,
                                              height: 200,
                                              child:       CreateAdsCubit.get(context)
                                                  .imageCheck
                                                  ? InkWell(
                                                  onTap: () {
                                                    CreateAdsCubit.get(
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
                                                  : Container(
                                                  width: 200,
                                                  height: 200,
                                                  //Image.memory(Uint8List.fromList(_selectedFile!))
                                                  //child:Image.memory(CreateCategoriesCubit.get(context).view)
                                                  child: Image.memory(
                                                    CreateAdsCubit.get(
                                                        context)
                                                        .khaled,
                                                    fit: BoxFit.cover,)
                                              ),
                                            ),

//                                             InkWell(
//                                               onTap: () {},
//                                               child: DottedBorder(
//                                                 color: Colors.grey,
//                                                 strokeWidth: 5,
//                                                 dashPattern: [16, 16, 16, 16],
// //radius: Radius.circular(12),
//                                                 child: Container(
//                                                   width: 200,
//                                                   height: 200,
//                                                   child: Icon(
//                                                     Icons.add,
//                                                     color: Colors.grey,
//                                                     size: 60,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
                                            Container(
                                              width: 400,
                                              height: 260,
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: 60,
                                                    width: 400,
                                                    child: DropdownButton(
                                                      hint: Text("Select Admin"),
                                                      items: CreateAdsCubit
                                                          .get(context)
                                                          .getAdminNameModel.data!
                                                          .map((e) => DropdownMenuItem(
                                                        child: Text('${e.companyName}'),
                                                        value: e.id,
                                                      ))
                                                          .toList(),
                                                      onChanged: (val) {
                                                        setState(() {
                                                          selectedAdmin = val!;
                                                          print(selectedAdmin);
                                                        });
                                                      },
                                                      value: selectedAdmin,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),

                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                      height: 60,
                                                      width: 180,
                                                      child: ConditionalBuilder(
                                                        condition: state is! CreateAdsLoadingState,
                                                        //condition: true,
                                                        builder: (context) =>defaultCreatebuttom(
                                                            height: 60,
                                                            width: 180,
                                                            label: "Create Ads",
                                                            onTap: () {

                                                                CreateAdsCubit
                                                                    .get(
                                                                    context)
                                                                    .CreateAds(
                                                                    AdminId: selectedAdmin,
                                                                    );
                                                               // CreateAdsCubit.get(context).getImage();
                                                                //Dragon Context

                                                            }),
                                                        fallback: (context) =>Center(child: CircularProgressIndicator(),),
                                                      )
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ]),
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
            } else if (state is getAdminNameLoadingState  || state is CreateAdsLoadingState )
              return Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/images/background3.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Center(child: CircularProgressIndicator()),
                ],
              );
            else
              return Container();

          },
        ));
  }
}
