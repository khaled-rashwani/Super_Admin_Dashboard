import 'dart:io';
import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:super_admin_dashboard/project_shared/network/dio.dart';
import 'package:super_admin_dashboard/super_admin_dashboard/create_admin/cubit/states.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:path_provider/path_provider.dart';
import 'package:super_admin_dashboard/project_shared/network/dio.dart';
import 'package:super_admin_dashboard/super_admin_dashboard/create_categories/create_categories_cubit/states.dart';
import 'dart:html' as html;
import 'package:path/path.dart' as Path;
import 'dart:io' as file;
import 'dart:typed_data';
import 'dart:html' as html;
import 'package:http_parser/http_parser.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class CreateAdminCubit extends Cubit<CreateAdminStates> {
  CreateAdminCubit() : super(CreateAdminInitialState());

  static CreateAdminCubit get(context) => BlocProvider.of(context);

  Future<void> CreateAdmin({required String CompanyName,
    required String Email,
    required String Password,
    required String ConfirmationPassword,
    required String PhoneNumber,
    required List<String> Address,
    required String Description,
    required String Percentage}) async {
    emit(CreateAdminLoadingState());
    var data = FormData.fromMap({
      'company_name': CompanyName,
      'email': Email,
      'password': Password,
      'password_confirmation': ConfirmationPassword,
      'phone_number': PhoneNumber,

      'address[]': Address,
      'description': Description,
      'percentage': Percentage,
      'logo' : await MultipartFile.fromBytes( _selectedFile!,
          contentType: MediaType('application', 'json'), filename: "Any_name"),

    });
    dioHelper.postData(
        url: 'api/super_admin/add_admin',
        data:
        data).then((value) {
      emit(CreateAdminSuccessState());
    }).catchError((error) {
      emit(CreateAdminErrorState());
    });
  }

  // Future<void> CreateAdmin(
  //     {required String CompanyName,
  //     required String Email,
  //     required String Password,
  //     required String ConfirmationPassword,
  //     required String PhoneNumber,
  //     required List<String> Address,
  //     required String Description,
  //     required String Percentage}) async {
  //   emit(CreateAdminLoadingState());
  //   dioHelper.postData(url: 'api/super_admin/add_admin', data: {
  //     'company_name': CompanyName,
  //     'email': Email,
  //     'password': Password,
  //     'password_confirmation': ConfirmationPassword,
  //     'phone_number': PhoneNumber,
  //
  //     'address': Address,
  //     'description': Description,
  //     'percentage': Percentage,
  //     'image' : await MultipartFile.fromBytes( _selectedFile!,
  //         contentType: MediaType('application', 'json'), filename: "Any_name"),
  //
  //   }).then((value) {
  //     emit(CreateAdminSuccessState());
  //   }).catchError((error) {
  //     emit(CreateAdminErrorState());
  //   });
  // }



  bool imageCheck = true;
  List<int>? _selectedFile;
  Uint8List? _bytesData;
  //Uint8List? khaled;
  Uint8List khaled = Uint8List(8);

  pickImage() async {
    html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
    uploadInput.multiple = true;
    uploadInput.draggable = true;
    uploadInput.click();

    uploadInput.onChange.listen((event) {
      final files = uploadInput.files;
      final file = files![0];
      final reader = html.FileReader();

      reader.onLoadEnd.listen((event) {
        _bytesData =
            Base64Decoder().convert(reader.result.toString().split(",").last);
        _selectedFile = _bytesData;
        if(_selectedFile != null){
          khaled =Uint8List.fromList(_selectedFile!);
          print(khaled);
          imageCheck = false;
          print(imageCheck);
          emit(GetImageCreateAdminSuccessState());
        }
        else{
          null;
        }
      });

      reader.readAsDataUrl(file);
    });
  }
}
