import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_admin_dashboard/super_admin_dashboard/home_screen2/home_screen_model.dart';
import 'package:super_admin_dashboard/super_admin_dashboard/users/users_cubit/states.dart';
import '../../project_shared/network/dio.dart';
import '../shared/components/components.dart';
import '../shared/components/graph.dart';
import '../../project_shared/constants.dart';
import '../../project_shared/responsive.dart';
import 'home_screen_cubit/cubit.dart';
import 'home_screen_cubit/states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeScreenCubit()
          ..getAdminCount()
          ..getUsersCount()
          ..getOrderCount()
          ..getBestSelling(),
        child: BlocConsumer<HomeScreenCubit, HomeScreenStates>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is BestSellingSuccessState) {
              return Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(defaultPadding),
                            child: Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 40,
                                  child: Text(
                                    "Details:",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: MyCard(
                                          text: "Total Users:",
                                          icon: Icons.person,
                                          Num: HomeScreenCubit.get(context)
                                              .userCountModel
                                              .totalOfUsersIs
                                              .toString()),
                                    ),
                                    SizedBox(
                                      width: 20,
                                      height: 20,
                                    ),
                                    Expanded(
                                      child: MyCard(
                                          text: "Total Admins :",
                                          icon: Icons.group,
                                          Num: HomeScreenCubit.get(context)
                                              .adminCountModel
                                              .totalOfAdminsIs
                                              .toString()),
                                    ),
                                    SizedBox(
                                      width: 20,
                                      height: 20,
                                    ),
                                    if (Responsive.isCard(context))
                                      Expanded(
                                        child: MyCard(
                                            text: "Total Orders:",
                                            icon: Icons.shopping_cart,
                                            Num: HomeScreenCubit.get(context)
                                                .orderCountModel
                                                .totalOfOrdersIs
                                                .toString()),
                                      ),
                                  ],
                                ),
                                SizedBox(
                                  height: 17,
                                ),
                                Divider(
                                  thickness: 2,
                                  height: 20,
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 40,
                                  child: Text(
                                    "Best Selling:",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Flexible(
                                        flex: 1,
                                        child: Container(
                                            alignment: Alignment.center,
                                            width: 130,
                                            child: Text(
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
                                            'Image',
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
                                            'Product Name',
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
                                            'Vendor Name',
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
                                            'Price',
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
                                            'Selling Count',
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
                                            'Discount price',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        )),
                                    SizedBox(),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Expanded(
                                  child: Container(
                                    width: 800,
                                    height: 300,
                                    child: _buildAdmins(
                                        HomeScreenCubit.get(context)
                                            .bestSellingModel,
                                        context),

                                    // child: ListView.separated(
                                    //   itemBuilder: (context, index) {
                                    //     return Container(
                                    //       height: 80,
                                    //       width: double.infinity,
                                    //       decoration: BoxDecoration(
                                    //           color: myLightBG,
                                    //           borderRadius:
                                    //           BorderRadius.all(Radius.circular(15))),
                                    //       child: Padding(
                                    //         padding: const EdgeInsets.all(2.0),
                                    //         child: Row(
                                    //           mainAxisAlignment:
                                    //           MainAxisAlignment.spaceBetween,
                                    //           crossAxisAlignment:
                                    //           CrossAxisAlignment.center,
                                    //           children: [
                                    //             Flexible(
                                    //                 flex: 1,
                                    //                 child: Container(
                                    //                     alignment: Alignment.center,
                                    //                     width: 120,
                                    //                     child: Text(
                                    //                       '#$index',
                                    //                       maxLines: 1,
                                    //                       overflow: TextOverflow.ellipsis,
                                    //                     ))),
                                    //             Flexible(
                                    //                 flex: 1,
                                    //                 child: Container(
                                    //                   alignment: Alignment.center,
                                    //                   width: 120,
                                    //                   child: Image.asset(
                                    //                     'assets/images/logo.png',
                                    //                     width: 55,
                                    //                   ),
                                    //                 )),
                                    //             Flexible(
                                    //                 flex: 1,
                                    //                 child: Container(
                                    //                   alignment: Alignment.center,
                                    //                   width: 120,
                                    //                   child: Text(
                                    //                     'T-shirt',
                                    //                     maxLines: 1,
                                    //                     overflow: TextOverflow.ellipsis,
                                    //                   ),
                                    //                 )),
                                    //             Flexible(
                                    //                 flex: 1,
                                    //                 child: Container(
                                    //                   alignment: Alignment.center,
                                    //                   width: 120,
                                    //                   child: Text(
                                    //                     'Adidas',
                                    //                     maxLines: 1,
                                    //                     overflow: TextOverflow.ellipsis,
                                    //                   ),
                                    //                 )),
                                    //             Flexible(
                                    //                 flex: 1,
                                    //                 child: Container(
                                    //                   alignment: Alignment.center,
                                    //                   width: 120,
                                    //                   child: Text(
                                    //                     'Clothes',
                                    //                     maxLines: 1,
                                    //                     overflow: TextOverflow.ellipsis,
                                    //                   ),
                                    //                 )),
                                    //             Flexible(
                                    //                 flex: 1,
                                    //                 child: Container(
                                    //                   alignment: Alignment.center,
                                    //                   width: 120,
                                    //                   child: Text(
                                    //                     '1250',
                                    //                     maxLines: 1,
                                    //                     overflow: TextOverflow.ellipsis,
                                    //                   ),
                                    //                 )),
                                    //             Flexible(
                                    //                 flex: 1,
                                    //                 child: Container(
                                    //                   alignment: Alignment.center,
                                    //                   width: 120,
                                    //                   child: Text(
                                    //                     '999',
                                    //                     maxLines: 1,
                                    //                     overflow: TextOverflow.ellipsis,
                                    //                   ),
                                    //                 )),
                                    //             SizedBox(),
                                    //           ],
                                    //         ),
                                    //       ),
                                    //     );
                                    //   },
                                    //   itemCount: 10,
                                    //   separatorBuilder:
                                    //       (BuildContext context, int index) {
                                    //     return SizedBox(
                                    //       height: 10,
                                    //     );
                                    //   },
                                    // ),
                                  ),
                                )
                              ],
                            ),
                          )),
                      if (Responsive.isDesktop(context))
                        Expanded(
                            flex: 2,
                            child: Stack(
                              children: [
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: myLightBG,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Container(
                                          width: 300,
                                          height: 300,
                                          // color: Colors.green,
                                          child: Graph(),
                                        ),
                                      ),
                                      Container(
                                        width: 300,
                                        height: 300,
                                        //color: Colors.red,
                                        child: GraphInfo(),
                                      )
                                    ],
                                  ),
                                ),
                                // Container(
                                //   color: Colors.blue,
                                //   width: double.infinity,
                                //   child: Column(
                                //     crossAxisAlignment: CrossAxisAlignment.center,
                                //     children: [
                                //       Container(
                                //         width: 200,
                                //         height: 200,
                                //         color: Colors.red,
                                //       ),
                                //     ],
                                //   ),
                                // )
                              ],
                            )),
                    ],
                  ));
            } else if (state is BestSellingLoadingState)
              return Center(child: CircularProgressIndicator());
            else
              return Container();
          },
        ));
  }
}

Widget _buildAdmins(BestSellingModel bestSelling, context) {
  print(baseUrl + bestSelling.data![1].productImages.toString());
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
                        child: !bestSelling.data![index].productImages!.isEmpty? FadeInImage.assetNetwork(
                          placeholder: '',
                          image: baseUrl +
                              bestSelling
                                  .data![index].productImages![0].productImage
                                  .toString(),
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
                        ) :Icon(Icons.image_not_supported_outlined),
                      )),
                Flexible(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      width: 130,
                      child: Text(
                        bestSelling.data![index].name.toString(),
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
                        bestSelling.data![index].adminId.toString(),
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
                        bestSelling.data![index].price.toString(),
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
                        bestSelling.data![index].sellCount.toString(),
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
                        bestSelling.data![index].discountPercentage.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )),
                SizedBox(),
              ],
            ),
          ),
        );
      },
      itemCount: bestSelling.data!.length,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 10,
        );
      },
    ),
  );
}
