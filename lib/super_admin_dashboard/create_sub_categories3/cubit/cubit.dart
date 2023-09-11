import 'dart:convert';
import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:super_admin_dashboard/project_shared/network/dio.dart';
import 'package:super_admin_dashboard/super_admin_dashboard/create_categories/create_categories_cubit/states.dart';
import 'package:super_admin_dashboard/super_admin_dashboard/create_sub_categories3/cubit/states.dart';
import '../../categories/categories_model.dart';
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

class CreateSubCategoriesCubit extends Cubit<CreateSubCategoriesStates> {
  CreateSubCategoriesCubit() : super(CreateSubCategoriesInitialState());

  SuperCategoriesModel getCategoryNameModel = SuperCategoriesModel();

  static CreateSubCategoriesCubit get(context) => BlocProvider.of(context);

  Future<void> CreateSubCategoris({    required String CategoryName,
    required int ParentId, }) async {
    emit(CreateSubCategoriesLoadingState());
    var data = FormData.fromMap({
      'name': CategoryName,
      'parent_id': ParentId,
      'image': await MultipartFile.fromBytes( _selectedFile!,
          contentType: MediaType('application', 'json'), filename: "Any_name"),
    });
    dioHelper.postData(
        url: 'api/super_admin/create_category',
        data:
        data).then((value) {
      emit(CreateSubCategoriesSuccessState());
    }).catchError((error) {
      emit(CreateSubCategoriesErrorState());
    });
  }


  // Future<void> CreateSubCategoris({
  //   required String CategoryName,
  //   required int ParentId,
  //   /*String? Image*/
  // }) async {
  //   emit(CreateSubCategoriesLoadingState());
  //   dioHelper.postData(url: 'api/super_admin/create_category', data: {
  //     'name': CategoryName,
  //     'parent_id': ParentId,
  //    'image': await MultipartFile.fromBytes( _selectedFile!,
  //   contentType: MediaType('application', 'json'), filename: "Any_name"),
  //
  //   }).then((value) {
  //     emit(CreateSubCategoriesSuccessState());
  //   }).catchError((error) {
  //     emit(CreateSubCategoriesErrorState());
  //   });
  // }

  void getCategoriesName() {
    try {
      emit(getCategoriesNameLoadingState());
      dioHelper
          .getData(
        url: 'api/admin/get_all_categories_with_produts',
      )
          .then((value) async {
        if (value != null) {
          getCategoryNameModel = SuperCategoriesModel.fromJson(value);
          emit(getCategoriesNameSuccessState());
        }
        print(value.toString());
      }).catchError((error) {
        emit(getCategoriesNameErrorState());
        print(error.toString());
      });
    } catch (e) {
      emit(getCategoriesNameErrorState());
      print(e);
    }
  }

  // Future<void> pickImage() async {
  //   final ImagePicker picker = ImagePicker();
  //   XFile? image = await picker.pickImage(source: ImageSource.gallery);
  //   try{
  //     if(image != null){
  //       print("+++++++++++++++++");
  //       k = XFile(image.path);
  //       print(k?.path.toString());
  //       print("+++++++++++++++++");
  //       var f = await image.readAsBytes();
  //       webImage = f;
  //       imageCheck = false;
  //       emit(CreateCategoriesImageSuccessState());
  //     }
  //     else{
  //       print("PPPPPPPPPPPPPP");
  //       print("error");
  //       emit(CreateCategoriesImageErrorState());
  //     }
  //
  //   }
  //   catch(e){
  //     emit(CreateCategoriesImageErrorState());
  //     print(e);
  //   }
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
        if (_selectedFile != null) {
          khaled = Uint8List.fromList(_selectedFile!);
          print(khaled);
          imageCheck = false;
          print(imageCheck);
          emit(getCategoriesNameSuccessState());
        } else {
          null;
        }
      });

      reader.readAsDataUrl(file);
    });
  }
}
