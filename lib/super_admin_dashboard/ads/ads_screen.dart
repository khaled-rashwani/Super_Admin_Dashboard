import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_admin_dashboard/super_admin_dashboard/create_advertisements/create_advertisements.dart';
import 'package:super_admin_dashboard/super_admin_dashboard/shared/components/components.dart';

import '../../project_shared/constants.dart';
import '../../project_shared/network/dio.dart';
import '../create_advertisements/create_ads.dart';
import 'ads_cubit/states.dart';
import 'ads_model.dart';
import 'ads_cubit/cubit.dart';
import 'ads_model2.dart';


class AdsScreen extends StatelessWidget {
  const AdsScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    return BlocProvider(

        create: (context) =>
        AdsCubit()
          ..getAds(),
        child: BlocConsumer<AdsCubit, AdsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is AdsSuccessState) {
              return Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 100,
                          child: Text(
                            '     Total Categories : ${AdsCubit
                                .get(context)
                                .adsModel
                                .data!
                                .length} ',
                            style: const TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Colors.grey),
                          ),
                        ),
                        defaultCreatebuttom(
                            label: 'Create New Advertisement', onTap: () {
                          navigateTo(context, CreateAdsScreen());
                        }),
                      ],
                    ),
                    Container(
                      height: 80,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                                flex: 1,
                                child: Container(
                                    alignment: Alignment.center,
                                    width: 130,
                                    child: const Text(
                                      '#ID',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ))),
                            Flexible(
                                flex: 1,
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 130,
                                  child: const Text(
                                    'Ads Image',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )),
                            Flexible(
                                flex: 1,
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 130,
                                  child: const Text(
                                    'Company Name',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )),
                            Flexible(
                                flex: 1,
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 180,
                                  child: const Text(
                                    'Company Email',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )),
                            Flexible(
                                flex: 1,
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 130,
                                  child: const Text(
                                    'Delete',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )),
                            SizedBox(),
                          ],
                        ),
                      ),
                    ),
                    if (AdsCubit
                        .get(context)
                        .adsModel
                        .data!
                        .length !=
                        0)
                      _buildCategories(
                          AdsCubit
                              .get(context)
                              .adsModel, context)
                  ],
                ),
              );
            } else if (state is AdsLoadingState ||
                state is deleteAdsLoadingState)
              return Center(child: CircularProgressIndicator());
            else
              return Container();
          },
        ));
  }
}

Widget _buildCategories(AdsModel ads, context) {
  return Expanded(
    child: ListView.separated(
      // shrinkWrap: true,
      itemBuilder: (context, index) {

        return Container(
          height: 80,
          width: double.infinity,
          decoration: BoxDecoration(
              color: myLightBG,
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                    flex: 1,
                    child: Container(
                        alignment: Alignment.center,
                        width: 130,
                        child: Text(
                          '#${index + 1}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ))),
                Flexible(
                    flex: 1,
                    child: Container(
                        alignment: Alignment.center,
                        width: 130,
                        //child :Image(image: NetworkImage('localhost:8000/storage/images/64cae43a0cd2a.json'))
                      //child :Image(image: NetworkImage('http://localhost:8000/storage/images/64caef934c223.json'))
                     // child:Image.memory('localhost:8000/storage/images/64cae43a0cd2a.json' as Uint8List,fit: BoxFit.cover,)
                     // child: Image.asset('assets/images/logo.png',width: 55,),
                      child: FadeInImage.assetNetwork(
                        placeholder: '',
                        image: baseUrl+ads.data![index].image.toString(),
                        width: 50,
                        fit: BoxFit.cover,
                        placeholderErrorBuilder: (BuildContext,
                            Object exception, StackTrace? stackTrace) {
                          return Container(
                            // color: Colors.grey.shade100,
                            //  child: const Icon(
                            //    Icons.image_not_supported_outlined,
                            //    size: 40,
                            //    color: Colors.yellow,
                            //  ),
                          );
                        },
                      ),
                      //child: Image(image: NetworkImage(baseUrl +category.data![index].image.toString()),fit: BoxFit.cover,)
                      // child: FadeInImage.assetNetwork(
                      //   placeholder: '',
                      //   image: baseUrl + category.data![index].image.toString(),
                      //   width: 50,
                      //   fit: BoxFit.cover,
                      //   placeholderErrorBuilder: (BuildContext,
                      //       Object exception, StackTrace? stackTrace) {
                      //     return Container(
                      //       color: Colors.grey.shade100,
                      //       child: const Icon(
                      //         Icons.image_not_supported_outlined,
                      //         size: 40,
                      //         color: Colors.white,
                      //       ),
                      //     );
                      //   },
                      // ),
                    )),
                Flexible(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      width: 130,
                      child: Text(
                        ads.data![index].admin!.companyName.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )),
                Flexible(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      width: 180,
                      child: Text(
                        ads.data![index].admin!.email.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )),
                Flexible(
                    flex: 1,
                    child: Container(
                        alignment: Alignment.center,
                        width: 130,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PopupMenuButton(itemBuilder: (context) =>
                            [
                              PopupMenuItem(child: Text("Confirm deletion",style: TextStyle(color: Colors.red),), onTap: (){AdsCubit.get(context).changeid(
                                  ads.data![index].id!);}),
                              PopupMenuItem(child: Text("Cancellation",style: TextStyle(color: Colors.green),),onTap: (){AdsCubit.get(context).getImage("storage/images/64d9fe13d2c9a.json");})
                            ],
                              icon: Icon(Icons.delete, color: Colors.red,),
                            ),
                          ],
                        ))),
                SizedBox(),
              ],
            ),
          ),
        );
      },
      itemCount: ads.data!.length,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 10,
        );
      },
    ),
  );
}
