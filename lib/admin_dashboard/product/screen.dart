import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../project_shared/constants.dart';
import '../../project_shared/network/dio.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';
import 'model.dart';


class XAdminProductScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => XAdminProductCubit()..getXAdminProduct(),
        child: BlocConsumer<XAdminProductCubit, XAdminProductStates>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is XAdminProductSuccessState) {
              return Padding(
                padding: const EdgeInsets.all(20),
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
                            '     Total Categories : ${XAdminProductCubit.get(context).xadminProductModel.products!.length} ',
                            style: const TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Colors.grey),
                          ),
                        ),
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
                                    'Category Name',
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
                                    'Product Price',
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
                                    'Product Discount',
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
                                    'Sell Count',
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
                                    'Status',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )),
                            SizedBox(),
                          ],
                        ),
                      ),
                    ),
                    if (XAdminProductCubit.get(context)
                        .xadminProductModel
                        .products!
                        .length !=
                        0)
                      _buildAdminProduct(
                          XAdminProductCubit.get(context).xadminProductModel,context)
                  ],
                ),
              );
            } else if (state is XAdminProductLoadingState  )
              return Center(child: CircularProgressIndicator());
            else
              return Container();
          },
        ));
  }
}

Widget _buildAdminProduct(XAdminProductModel product, context) {
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
                        child: Container(
                          alignment: Alignment.center,
                          width: 130,
                          child:  product.products![index].productImages![0].productImage != null? FadeInImage.assetNetwork(
                            placeholder: '',
                            image: baseUrl +
                                product.products![index].productImages![0].productImage
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
                        ),)),
                Flexible(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      width: 130,
                      child: Text(
                        product.products![index].name.toString(),
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
                        product.products![index].categoryName.toString(),
                        //category.data![index].children!.length.toString(),
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
                        product.products![index].price.toString(),
                        //category.data![index].children!.length.toString(),
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
                        product.products![index].discountPercentage.toString(),
                        //category.data![index].children!.length.toString(),
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
                        product.products![index].sellCount.toString(),
                        //category.data![index].children!.length.toString(),
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
                        product.products![index].approved==1?'Approved':'Pending',
                        //category.data![index].children!.length.toString(),
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
      itemCount: product.products!.length,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 10,
        );
      },
    ),
  );
}
