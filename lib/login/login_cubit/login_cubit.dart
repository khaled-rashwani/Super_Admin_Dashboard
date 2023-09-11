import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:super_admin_dashboard/login/login_screen.dart';
import '../../admin_dashboard/layout/admin_layout.dart';
import '../../project_shared/network/dio.dart';
import '../../project_shared/network/shared_preferences.dart';
import '../../super_admin_dashboard/layout/dashboard_layout/dashboard_layout.dart';
import '../../super_admin_dashboard/shared/components/components.dart';
import 'login_states.dart';


class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());


  static AuthCubit get(context) => BlocProvider.of(context);

  void userLogin({required String email, required String password, required context}) async {
    assert(context != null);
    emit(LoginLoadingState());
    try {
      final response = await dioHelper.postData(
        url: 'api/dashboard/dashboard_login',
        data: {
          'email': email,
          'password': password,
        },
      );
      if (response.data["status"] == 1) {
        CacheHelper.saveData(key: 'token', value: response.data["token"]);
        CacheHelper.saveData(key: 'isSuperAdmin', value: response.data["is_super_admin"]);
        if (response.data["is_super_admin"] == 0) {
          navigateTo(context, AdminDashboardLayout());
          CacheHelper.saveData(key: 'id', value: response.data["data"]["id"]);
          emit(LoginSuccessState());
        }
        else if (response.data["is_super_admin"] == 1) {
          print('super');
          navigateTo(context, DashboardLayout());
          emit(LoginSuccessState());
        }
        emit(LoginSuccessState());
        print('success login');
        print('TOKEN:  '+ CacheHelper.getToken());
      } else if (response.data["status"] == 0) {
        print(response.data['message']);
        emit(LoginErrorState());
      }
    } catch (error) {
      emit(LoginErrorState());
      print(error.toString());
    }
  }
  // void userLogin({required String email, required String password, required context}) async {
  //   assert(context != null);
  //   emit(LoginLoadingState());
  //   try {
  //     final response = await dioHelper.postData(
  //       url: 'api/dashboard/dashboard_login',
  //       data: {
  //         'email': email,
  //         'password': password,
  //       },
  //     );
  //     if (response.data["status"] == 1) {
  //       CacheHelper.saveData(key: 'token', value: response.data["token"]);
  //       CacheHelper.saveData(key: 'isSuperAdmin', value: response.data["is_super_admin"]);
  //
  //       if (response.data["is_super_admin"] == 0) {
  //         // Navigator.pushAndRemoveUntil(
  //         //   context,
  //         //   MaterialPageRoute(builder: (context) => AdminDashboardLayout()),
  //         //       (Route<dynamic> route) => false,
  //         // );
  //         navigateTo(context, AdminDashboardLayout());
  //         CacheHelper.saveData(key: 'id', value: response.data["data"]["id"]);
  //         emit(LoginSuccessState());
  //
  //       }
  //
  //       else if (response.data["is_super_admin"] == 1) {
  //          Navigator.pushReplacement(
  //            context,
  //            MaterialPageRoute(
  //              builder: (context) => DashboardLayout(),
  //            ),
  //          );
  //          emit(LoginSuccessState());
  //
  //        }
  //
  //       emit(LoginSuccessState());
  //       print('success login');
  //       print('TOKEN:  '+ CacheHelper.getToken());
  //     } else if (response.data["status"] == 0) {
  //       print(response.data['message']);
  //       emit(LoginErrorState());
  //     }
  //   } catch (error) {
  //     emit(LoginErrorState());
  //     print(error.toString());
  //   }
  // }

  Icon suffix = Icon(Icons.visibility_off_outlined);
  bool isPassword = true;

  void changePasswordVisibility() {
    suffix = isPassword
        ? Icon(Icons.visibility_off_outlined)
        : Icon(Icons.visibility);
    isPassword = !isPassword;
    emit(ChangePasswordVisibilityState());
  }


  var image = File('');
  Future pickImage() async {
    emit(ProfileImageSelectedLoadingState());
    final pickedfile =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedfile != null) {
      image = File(pickedfile.path);
      print(
          '--------------------------------------------------------------------');
      print(image.path);
      print(
          '--------------------------------------------------------------------');
      emit(ProfileImageSelectedSuccessState());
    } else {
      if (image != null) {
        emit(ProfileImageSelectedSuccessState());
      } else {
        emit(ProfileImageSelectedErrorState());
        print('no image selected');
      }
    }
    return image;
  }




  // bool logout() {
  //   emit(LoginLoadingState());
  //   dioHelper.postData(
  //     url: 'api/user/logout',
  //   ).then((value) {
  //     if (value.statusCode == 200) {
  //       if (value.data["status"] == 1) {
  //         CacheHelper.saveData(key: 'token', value:null);
  //         CacheHelper.saveData(key: 'user_name', value: '');
  //         CacheHelper.saveData(key: 'phone_number', value:'');
  //         CacheHelper.saveData(key: 'profile_img_url', value:'images/default_user2.png');
  //         emit(LogoutSuccessState());
  //         print('success logout');
  //         print('TOKEN:  '+ CacheHelper.getToken());
  //         return true;
  //       } else {
  //         emit(LogoutErrorState());
  //       }
  //     } else if (value.data["status"] == 0) {
  //       emit(LogoutErrorState());
  //       print(value.data["message"]);
  //     }
  //     else if (value.statusCode == 422)
  //     {
  //       emit(LogoutErrorState());
  //     } else if (value.statusCode! >= 500) {
  //       emit(LogoutErrorState());
  //     } else {
  //       emit(LogoutErrorState());
  //     }
  //   }
  //   ).catchError((error) {
  //     emit(LogoutErrorState());
  //     print(error.toString());
  //   });
  //   return false;
  // }

  logout(context) {
    emit(LogoutLoadingState());
    dioHelper
        .postData(
      url: 'api/admin/logout',
    )
        .then((value) {
      CacheHelper.saveData(key: 'token', value: '');
      CacheHelper.saveData(key: 'user_name', value: '');
      CacheHelper.saveData(key: 'phone_number', value: '');
      CacheHelper.saveData(
          key: 'profile_img_url', value: 'images/default_user2.png');
      emit(LogoutSuccessState());
      print('success logout');
      print('TOKEN:  ' + CacheHelper.getToken().toString());
      NavigateAndFinish(context, LoginScreen());
    }).catchError((error) {
      emit(LogoutErrorState());
      print(error.toString());
    });
  }

  superAdminLogout(context) {
    emit(SuperAdminLogoutLoadingState());
    dioHelper
        .postData(
      url: 'api/super_admin/logout',
    )
        .then((value) {
      CacheHelper.saveData(key: 'token', value: '');
      CacheHelper.saveData(key: 'user_name', value: '');
      CacheHelper.saveData(key: 'phone_number', value: '');
      CacheHelper.saveData(
          key: 'profile_img_url', value: 'images/default_user2.png');
      emit(SuperAdminLogoutSuccessState());
      print('success logout');
      print('TOKEN:  ' + CacheHelper.getToken().toString());
      NavigateAndFinish(context, LoginScreen());
    }).catchError((error) {
      emit(SuperAdminLogoutErrorState());
      print(error.toString());
    });
  }

}
