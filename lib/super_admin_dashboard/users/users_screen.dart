import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_admin_dashboard/super_admin_dashboard/shared/components/components.dart';
import 'package:super_admin_dashboard/super_admin_dashboard/users/users_cubit/cubit.dart';
import 'package:super_admin_dashboard/super_admin_dashboard/users/users_cubit/states.dart';
import 'package:super_admin_dashboard/super_admin_dashboard/users/users_model.dart';
import '../../project_shared/constants.dart';
import '../../project_shared/network/dio.dart';
import '../create_admin/create_admin.dart';
import '../create_categories/create_categories.dart';


class UsersScreen extends StatelessWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => UsersCubit()..getUsers(),
        child: BlocConsumer<UsersCubit, UsersStates>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is UsersSuccessState) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
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
                            '     Total Categories : ${UsersCubit.get(context).usersModel.data!.length} ',
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
                                    'User Name',
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
                                    'Phone Number',
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
                                    'Email',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )),
                            SizedBox(),
                          ],
                        ),
                      ),
                    ),
                    if (UsersCubit.get(context)
                        .usersModel
                        .data!
                        .length !=
                        0)
                      _buildUsers(
                         UsersCubit.get(context).usersModel,context)
                  ],
                ),
              );
            } else if (state is UsersLoadingState)
              return Center(child: CircularProgressIndicator());
            else
              return Container();
          },
        ));
  }
}

Widget _buildUsers(UsersModel user, context) {
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
                          '#$index',
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
                        image: baseUrl+user.data![index].profileImgUrl.toString(),
                        width: 50,
                        fit: BoxFit.cover,
                        placeholderErrorBuilder: (BuildContext,
                            Object exception, StackTrace? stackTrace) {
                          return Container(
                            // color: Colors.grey.shade100,
                            // child: const Icon(
                            //   Icons.image_not_supported_outlined,
                            //   size: 40,
                            //   color: Colors.white60,
                            // ),
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
                        user.data![index].userName.toString(),
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
                        user.data![index].phoneNumber.toString(),
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
                        user.data![index].email.toString(),
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
      itemCount: user.data!.length,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 10,
        );
      },
    ),
  );
}
