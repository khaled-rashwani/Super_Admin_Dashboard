import 'dart:convert';
import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:super_admin_dashboard/project_shared/network/dio.dart';
import 'package:super_admin_dashboard/super_admin_dashboard/ads/ads_cubit/image_model.dart';
import 'package:super_admin_dashboard/super_admin_dashboard/ads/ads_cubit/states.dart';
import '../ads_model2.dart';
import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;



class AdsCubit extends Cubit<AdsStates> {
  AdsCubit() : super(AdsInitialState());

  static AdsCubit get(context) => BlocProvider.of(context);

  AdsModel adsModel = AdsModel();
  String? test;
  var test2;
  String? imagePath;
  String Khaled = "localhost:8000/";
  var deleteAdsId ;








  void getAds() {
    try {
      emit(AdsLoadingState());
      dioHelper
          .getData(
        url: 'api/super_admin/get_ads',

      )
          .then((value) async {
        if (value != null) {
         adsModel = AdsModel.fromJson(value);
          //imagePath = Khaled + adsModel.data![1].image.toString() ;
          //readJsonFile();
          emit(AdsSuccessState());
        }
        print(value.toString());
      }).catchError((error) {
        emit(AdsErrorState());
        print(error.toString());
      });
    } catch (e) {
      emit(AdsErrorState());
      print(e);
    }
  }

  void changeid(var id){
    deleteAdsId = id;
    deleteAds();
  }

  void deleteAds() {
    try {
      emit(deleteAdsLoadingState());
      dioHelper
          .deleteData(
        url: 'api/super_admin/delete_ads/${deleteAdsId}',
      )
          .then((value) async {
        if (value != null) {
          getAds();
          emit(deleteAdsSuccessState());
        }
      }).catchError((error) {
        emit(deleteAdsErrorState());
        print(error.toString());
      });
    } catch (e) {
      emit(deleteAdsErrorState());
      print(e);
    }
  }



  // Future<void> readJsonFile() async {
  //   try {
  //     String jsonString = await rootBundle.loadString('localhost:8000/storage/images/64cae2c2bb5f7.json');
  //     List<int> data = json.decode(jsonString).cast<int>();
  //     print(data); // Output: [1, 2, 3, 4]
  //   } catch (e) {
  //     print('Error reading JSON file: $e');
  //   }
  // }

  // Future<dynamic> readImage() async{
  //   const url="http://192.168.1.103:8000/storage/images/64cbe0c231b71.json";
  //   final response = await http.get(Uri.parse(url));
  //   final body = json.decode(response.body);
  //   print(body.toString());
  // }


  // Map<String, dynamic> jsonData = {};
  //
  // Future<void> loadJsonData() async {
  //   final url = Uri.parse('http://192.168.1.103:8000/storage/images/64cbe0c231b71.json');
  //
  //   try {
  //     final response = await http.get(url);
  //     if (response.statusCode == 200) {
  //         jsonData = jsonDecode(response.body);
  //         print(jsonData['image']);
  //         emit(ImageAdsSuccessState());
  //     } else {
  //       // Handle error response
  //       print('Failed to load JSON data. Error: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     // Handle network or other errors
  //     print('Error: $e');
  //   }
  // }

  getImage(url) async {
    try {
      final response = await dioHelper.getData( url: url);
      //  final String codeUnits =response.value;
      //  final Uint8List unit8List = Uint8List.fromList(codeUnits.codeUnits);
      //  image= unit8List;
      print('----------------------');
      print(response['image'].toString());
      //return unit8List;
    } catch (error) {
      // Propagate network errors
      print(error.toString());
      throw error;
    }

  }








}
