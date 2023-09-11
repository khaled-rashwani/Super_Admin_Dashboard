import 'dart:html';
import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:super_admin_dashboard/project_shared/network/dio.dart';
import 'package:super_admin_dashboard/super_admin_dashboard/create_advertisements/create_ads_cubit/states.dart';
import '../../admins/admins_model.dart';
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




class CreateAdsCubit extends Cubit<CreateAdsStates> {
  CreateAdsCubit() : super(CreateAdsInitialState());


  AdminsModel getAdminNameModel = AdminsModel();




  static CreateAdsCubit get(context) => BlocProvider.of(context);

  Future<void> CreateAds({required int AdminId }) async {
    emit(CreateAdsLoadingState());
    var data = FormData.fromMap({
      'admin_id':AdminId ,
      'image': await MultipartFile.fromBytes( _selectedFile!,
          contentType: MediaType('application', 'json'), filename: "Any_name"),
    });
    dioHelper.postData(
        url: 'api/super_admin/create_ads',
        data:
        data).then((value) {
      emit(CreateAdsSuccessState());
    }).catchError((error) {
      emit(CreateAdsErrorState());
    });
  }

  // void CreateAds({  required int AdminId,required String webImage }) {
  //   emit(CreateAdsLoadingState());
  //   dioHelper.postData(
  //       url: 'api/super_admin/create_ads',
  //       data: {'admin_id':AdminId ,'image':webImage })
  //       .then((value) {
  //     emit(CreateAdsSuccessState());
  //   }).catchError((error) {
  //     emit(CreateAdsErrorState());
  //   });
  // }

  void getAdminName() {
    try {
      emit(getAdminNameLoadingState());
      dioHelper
          .getData(
        url: 'api/admin/get',
      )
          .then((value) async {
        if (value != null) {
          getAdminNameModel = AdminsModel.fromJson(value);
          emit(getAdminNameSuccessState());
        }
        print(value.toString());
      }).catchError((error) {
        emit(getAdminNameErrorState());
        print(error.toString());
      });
    } catch (e) {
      emit(getAdminNameErrorState());
      print(e);
    }
  }



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
          emit(getAdminNameSuccessState());
        }
        else{
          null;
        }
      });

      reader.readAsDataUrl(file);
    });
  }









}




