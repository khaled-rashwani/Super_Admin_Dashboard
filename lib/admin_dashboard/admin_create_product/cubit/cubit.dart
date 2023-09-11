import 'dart:typed_data';
import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:super_admin_dashboard/admin_dashboard/admin_create_product/cubit/states.dart';
import 'package:super_admin_dashboard/project_shared/network/dio.dart';
import 'package:super_admin_dashboard/project_shared/network/shared_preferences.dart';

import '../cat_model.dart';
import '../cat_model.dart';
import '../cat_model.dart';
import '../model.dart';

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
import 'dart:html' as html;
import 'package:path/path.dart' as Path;
import 'dart:io' as file;

import 'dart:typed_data';
import 'dart:html' as html;
import 'package:http_parser/http_parser.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CreateProductCubit extends Cubit<CreateProductStates> {
  CreateProductCubit() : super(CreateProductInitialState());


  var imageList;
  var Color;
  ColorsModel getColorsModel = ColorsModel();
  SizesModel getSizesModel = SizesModel();
  GetCategoryNameModel getCategoryNameModel = GetCategoryNameModel();

  static CreateProductCubit get(context) => BlocProvider.of(context);

  // void CreateProductButton({required String ProductName ,  required int CategoryID,required List<String> Address/*String? Image*/ }) {
  //   emit(CreateProductButtonLoadingState());
  //   dioHelper.postData(
  //       url: 'api/super_admin/create_category',
  //       data: {'name': CategoryName ,'parent_id':ParentId/*'image':Image*/})
  //       .then((value) {
  //     emit(CreateProductButtonSuccessState());
  //   }).catchError((error) {
  //     emit(CreateProductButtonErrorState());
  //   });
  // }

  void getData() {
    bool getRate = false, getComments = false, getProfile = false;
    try {
      emit(LastLoadingState());
      final ColorDataFuture = dioHelper.getData(
        url: 'api/product/get_colors',
      );
      final SizeDataFuture = dioHelper.getData(
        url: 'api/product/get_type_sizes/1',
      );
      final productDataFuture = dioHelper.getData(
        url: 'api/admin/get_all_categories_with_produts',
      );
      Future.wait([
        ColorDataFuture,
        SizeDataFuture,
        productDataFuture,
      ]).then((responses) {
        final ColorData = responses[0];
        final SizeData = responses[1];
        final productData = responses[2];
        if (ColorData != null) {
          getColorsModel = ColorsModel.fromJson(ColorData);
          getRate = true;
        }
        if (SizeData != null) {
          getSizesModel = SizesModel.fromJson(SizeData);
          getComments = true;
        }
        if (productData != null) {
          getCategoryNameModel = GetCategoryNameModel.fromJson(productData);
          getProfile = true;
        }

        if (getRate && getComments && getProfile) {
          emit(LastSuccessState());
        } else {
          emit(LastErrorState());
        }
      }).catchError((error) {
        emit(LastErrorState());
      });
    } catch (e) {
      emit(LastErrorState());
    }
  }

  // void getColors() {
  //   try {
  //     emit(GetColorsLoadingState());
  //     dioHelper
  //         .getData(
  //       url: 'api/product/get_colors',
  //     )
  //         .then((value) async {
  //       if (value != null) {
  //         getColorsModel = ColorsModel.fromJson(value);
  //         emit(GetColorsSuccessState());
  //       }
  //       print(value.toString());
  //     }).catchError((error) {
  //       emit(GetColorsErrorState());
  //       print(error.toString());
  //     });
  //   } catch (e) {
  //     emit(GetColorsErrorState());
  //     print(e);
  //   }
  // }

  // void getSizes() {
  //   try {
  //     emit(GetSizesLoadingState());
  //     dioHelper
  //         .getData(
  //       url: 'api/product/get_type_sizes/1',
  //     )
  //         .then((value) async {
  //       if (value != null) {
  //         getSizesModel = SizesModel.fromJson(value);
  //         emit(GetSizesSuccessState());
  //       }
  //       print(value.toString());
  //     }).catchError((error) {
  //       emit(GetSizesErrorState());
  //       print(error.toString());
  //     });
  //   } catch (e) {
  //     emit(GetSizesErrorState());
  //     print(e);
  //   }
  // }
// dynamic id=CacheHelper.getData(key: 'id')??0;
//   void getNameCategories() {
//     try {
//       emit(GetCategoryNameLoadingState());
//       dioHelper
//           .getData(
//         url: 'api/admin/get_all_categories_with_produts',
//       )
//           .then((value) async {
//         if (value != null) {
//           getCategoryNameModel = GetCategoryNameModel.fromJson(value);
//           emit(GetCategoryNameSuccessState());
//         }
//         print(value.toString());
//         //  Logger().d(value);
//       }).catchError((error) {
//         emit(GetCategoryNameErrorState());
//         print(error.toString());
//         //  Logger().e(error);
//       });
//     } catch (e) {
//       emit(GetCategoryNameErrorState());
//       print(e);
//     }
//   }

  Future<void> CreateProduct({
    required String ProductName,
    required int ProductPrice,
    required String ProductDescription,
    required List<String> ProductTag,
    required List<Map<String, String>> ProductVariants,
    required int ProductDiscount,required Cate
  }) async {
    emit(CreateProductLoadingState());

    List<MultipartFile> imageFiles = [];
    for (var imageData in Images) {
      MultipartFile image = MultipartFile.fromBytes(
        imageData,
        contentType: MediaType('application', 'json'), filename: "Any_name",
      );
      imageFiles.add(image);
    }

    var data = FormData.fromMap({
      'name': ProductName,
      'price': ProductPrice,
      'description': ProductDescription,
       'tag[]': ProductTag,
      'variants': ProductVariants,
      'discount_percentage': ProductDiscount,
      'product_image[]': imageFiles,
    });
    print(data);
    dioHelper
        .postData(url: 'api/product/add_product/$Cate', data: data)
        .then((value) {
      emit(CreateProductSuccessState());
    }).catchError((error) {
      emit(CreateProductErrorState());
    });
  }

  List<int>? _selectedFile;
  List Images = [];

  // dynamic ImageList ;
  Uint8List? _bytesData;
  bool imageCheck = true;
  Uint8List khaled = Uint8List(8);
   List ImageShower=[];
  pickImage() async {
    html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
    uploadInput.multiple = true;
    uploadInput.draggable = true;
    uploadInput.multiple = true;
    uploadInput.click();

    uploadInput.onChange.listen((event) {
      final files = uploadInput.files;
      final file = files![0];
      final reader = html.FileReader();
print(reader);
      reader.onLoadEnd.listen((event) {
        _bytesData =
            Base64Decoder().convert(reader.result.toString().split(",").last);
        _selectedFile = _bytesData;
        if (_selectedFile != null) {
          print('test');
          print(_selectedFile);
          print('test');

          print(Images.length);

          Images.add(_selectedFile);
          emit(ImagePickSuccessState());
          print(Images.length);
          khaled = Uint8List.fromList(_selectedFile!);
          imageCheck = false;
        } else {
          null;
        }
      });

      reader.readAsDataUrl(file);
    });
  }
//   pickImage() async {
//     html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
//     uploadInput.multiple = true; // Allow multiple file selection
//     uploadInput.draggable = true;
//     uploadInput.click();
//     print('test1');
//
//     uploadInput.onChange.listen((event) {
//       final files = uploadInput.files;
//       final reader = html.FileReader();
// print('test2');
//       for (var file in files!) {
//         reader.onLoadEnd.listen((event) {
//           _bytesData =
//               Base64Decoder().convert(reader.result.toString().split(",").last);
//           ImageList.add(_bytesData!);
//           print('test3');
//           print(ImageList);
// // Add the bytes data to ImageList
//         });
//
//         reader.readAsDataUrl(file);
//       }
//     });
//   }
}
