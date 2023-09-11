import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_admin_dashboard/super_admin_dashboard/orders/order_model.dart';
import 'package:super_admin_dashboard/super_admin_dashboard/products_request/model.dart';
import 'package:super_admin_dashboard/super_admin_dashboard/shared/components/components.dart';
import '../../project_shared/constants.dart';
import '../../project_shared/network/dio.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';


class ProductRequestScreen2 extends StatelessWidget {
  const ProductRequestScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ProductRequestCubit()..getProductRequest(),
        child: BlocConsumer<ProductRequestCubit, ProductRequestStates>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is ProductRequestSuccessState) {
              return Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 100,
                          child: Text(
                            '     Total Categories : ${ProductRequestCubit.get(context).productRequestModel.pendingProducts!.length} ',
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
                                  width: 180,
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
                                  width: 180,
                                  child: const Text(
                                    'Category',
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
                                    'Accept/Reject',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )),
                            SizedBox(),
                          ],
                        ),
                      ),
                    ),
                    if (ProductRequestCubit.get(context)
                        .productRequestModel
                        .pendingProducts!
                        .length !=
                        0)
                      _buildCategories(
                          ProductRequestCubit.get(context).productRequestModel,context)
                  ],
                ),
              );
            } else if (state is ProductRequestLoadingState ||  state is ProductAcceptLoadingState)
              return Center(child: CircularProgressIndicator());
            else
              return Container();
          },
        ));
  }
}

Widget _buildCategories(ProductRequestModel product, context) {
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
                    child: FadeInImage.assetNetwork(
                      placeholder: '',
                      image: baseUrl+ product.pendingProducts![index].product!.productImages![0].productImage.toString(),
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
                    ),),
                Flexible(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      width: 130,
                      child: Text(
                        product.pendingProducts![index].product!.name.toString(),
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
                        product.pendingProducts![index].product!.categoryName.toString(),
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
                        product.pendingProducts![index].product!.companyName.toString(),
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
                        product.pendingProducts![index].product!.categoryName.toString(),
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
                        product.pendingProducts![index].product!.price.toString(),
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
                            IconButton(onPressed: () {
                              ProductRequestCubit.get(context).ProductAccept(ProductId: product.pendingProducts![index].id!, Action: 1);
                            },
                                icon: Icon(
                                  Icons.check, color: Colors.green,)),
                            SizedBox(width: 20,),
                            IconButton(onPressed: () {
                              ProductRequestCubit.get(context).ProductAccept(ProductId: product.pendingProducts![index].id!, Action: 0);
                            },
                                icon: Icon(
                                  Icons.close, color: Colors.red,)),

                          ],
                        ))),

                SizedBox(),
              ],
            ),
          ),
        );
      },
      itemCount: product.pendingProducts!.length,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 10,
        );
      },
    ),
  );
}
