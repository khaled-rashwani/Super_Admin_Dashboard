import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_admin_dashboard/super_admin_dashboard/shared/components/components.dart';
import 'package:super_admin_dashboard/super_admin_dashboard/sub_categories/sub_category_cubit/cubit.dart';
import 'package:super_admin_dashboard/super_admin_dashboard/sub_categories/sub_category_cubit/states.dart';
import 'package:super_admin_dashboard/super_admin_dashboard/sub_categories/sub_category_model.dart';
import '../../project_shared/constants.dart';
import '../../project_shared/network/dio.dart';
import '../create_admin/create_admin.dart';
import '../create_sub_categories3/create_sub_categories.dart';



class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SubCategoryCubit()..getSubCategory(),
        child: BlocConsumer<SubCategoryCubit, SubCategoryStates>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is SubCategorySuccessState) {
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
                            '     Total Categories : ${SubCategoryCubit.get(context).subCategoryModel.data!.length} ',
                            style: const TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Colors.grey),
                          ),
                        ),
                        defaultCreatebuttom(label: 'Create New SubCategory', onTap: () {
                          navigateTo(context, CreateSubcategoriesScreen());
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
                                    'SubCategory Name',
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
                                    'Parent ID',
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
                                    'Actions',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )),
                            SizedBox(),
                          ],
                        ),
                      ),
                    ),
                    if (SubCategoryCubit.get(context)
                        .subCategoryModel
                        .data!
                        .length !=
                        0)
                      _buildAdmins(
                          SubCategoryCubit.get(context).subCategoryModel,context)
                  ],
                ),
              );
            } else if (state is SubCategoryLoadingState)
              return Center(child: CircularProgressIndicator());
            else
              return Container();
          },
        ));
  }
}

Widget _buildAdmins(SubCategoryModel subCategory, context) {
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
                        // child: Image.asset('assets/images/logo.png',width: 55,),
                      child: FadeInImage.assetNetwork(
                        placeholder: '',
                        image: baseUrl+subCategory.data![index].image.toString(),
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
                        )),
                Flexible(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      width: 130,
                      child: Text(
                        subCategory.data![index].name.toString(),
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
                        subCategory.data![index].parentId.toString(),
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
                            SizedBox(width: 20,),
                            PopupMenuButton(itemBuilder: (context) =>
                            [
                              PopupMenuItem(child: Text("Confirm deletion",style: TextStyle(color: Colors.red),), onTap: (){SubCategoryCubit.get(context).changeid(
                                  subCategory.data![index].id!);}),
                              PopupMenuItem(child: Text("Cancellation",style: TextStyle(color: Colors.green),))
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
      itemCount: subCategory.data!.length,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 10,
        );
      },
    ),
  );
}
