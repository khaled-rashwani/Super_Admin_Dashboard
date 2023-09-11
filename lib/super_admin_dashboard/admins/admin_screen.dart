import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_admin_dashboard/admin_dashboard/admin_product/admin_products.dart';
import 'package:super_admin_dashboard/super_admin_dashboard/shared/components/components.dart';
import '../../project_shared/constants.dart';
import '../../project_shared/network/dio.dart';
import '../admin_products/AdminProductScreen.dart';
import '../admin_products/cubit/cubit.dart';
import '../create_admin/create_admin.dart';
import '../create_admin/create_admins.dart';
import '../create_categories/create_categories.dart';
import 'admins_cubit/cubit.dart';
import 'admins_cubit/states.dart';
import 'admins_model.dart';


class AdminsScreen extends StatelessWidget {
  const AdminsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AdminsCubit()..getAdmins(),
        child: BlocConsumer<AdminsCubit, AdminsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is AdminsSuccessState) {
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
                            '     Total Categories : ${AdminsCubit.get(context).adminsModel.data!.length} ',
                            style: const TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Colors.grey),
                          ),
                        ),
                        defaultCreatebuttom(label: 'Create New Admin', onTap: () {
                          navigateTo(context, CreateAdminScreen());
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
                                    'wallet',
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
                                    'Phone Number',
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
                                    'Product',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )),
                            SizedBox(),
                          ],
                        ),
                      ),
                    ),
                    if (AdminsCubit.get(context)
                        .adminsModel
                        .data!
                        .length !=
                        0)
                      _buildAdmins(
                          AdminsCubit.get(context).adminsModel,context)
                  ],
                ),
              );
            } else if (state is AdminsLoadingState)
              return Center(child: CircularProgressIndicator());
            else
              return Container();
          },
        ));
  }
}

Widget _buildAdmins(AdminsModel admin, context) {
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
                          '#${index + 1 }',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ))),
                Flexible(
                    flex: 1,
                    child: Container(
                        alignment: Alignment.center,
                        width: 130,
                      child: FadeInImage.assetNetwork(
                        placeholder: '',
                        image: baseUrl+admin.data![index].logo.toString(),
                        width: 50,
                        fit: BoxFit.cover,
                        placeholderErrorBuilder: (BuildContext,
                            Object exception, StackTrace? stackTrace) {
                          return Container(
                            color: Colors.grey.shade100,
                            child: const Icon(
                              Icons.image_not_supported_outlined,
                              size: 40,
                              color: Colors.white60,
                            ),
                          );
                        },
                      ),
                        // child: Image.asset('assets/images/logo.png',width: 55,),
                       // child: Image(image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/2008px-Google_%22G%22_Logo.svg.png')
                          // child: FadeInImage.assetNetwork(
                          //   placeholder: '',
                          //   image: baseUrl+category.data![index].image.toString(),
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
                        admin.data![index].companyName.toString(),
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
                        admin.data![index].wallet.toString(),
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
                        admin.data![index].phoneNumber.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )),
                IconButton(
                    onPressed: () {
                      //AdminProductCubit.get(context).getAdminProduct(admin.data![index].id);
                      navigateTo(context, AdminProductScreen( admin.data![index].id,));
                    },
                    icon: Icon(
                      Icons.remove_red_eye_outlined,
                      color: Colors.grey,
                    )),
                SizedBox(),
              ],
            ),
          ),
        );
      },
      itemCount: admin.data!.length ,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 10,
        );
      },
    ),
  );
}
