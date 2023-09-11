import 'dart:io';
import 'package:dio/dio.dart';
import 'package:super_admin_dashboard/project_shared/network/shared_preferences.dart';

String baseUrl = 'http://192.168.105.247:8000/';
String TOKEN = CacheHelper.getToken()??'';
String TOKEN3 = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZTgxMTQ4NDM3OWZhNzVhMDQ3MjEwMTlkNmNjMjJkYjlmZmYzODYyYWY3ZTRmODUzMzE2OWE0NTM3NjI3ODJmNTc1NWM3YjU0MTJmYWI2ODgiLCJpYXQiOjE2OTIzOTQ4MjAuMDUwNjE0LCJuYmYiOjE2OTIzOTQ4MjAuMDUwNjIsImV4cCI6MTcyNDAxNzIyMC4wNDY3MTYsInN1YiI6IjQiLCJzY29wZXMiOlsiYWRtaW4iXX0.c1WYthlSk35zeylKJsq7BYgEas2d05_6HQRXRr0a6emOrvst9DSMOARQD7a4Izo4oktKEyQxpqMxI38SwNbfJtO2fXPjg6mhcTTlu_WCnzrhW7Cur0zVf2U69T9CbPPTfWUl7tfTxefANps_HrMaV9QEglM3i97PZ-jam0DippERrRi3HBooB5yueVqogOWeoAjTzyghEQFlouB9bsByqU9CPq2SmWuE-K2jON3Pc5UHl3OBvT1mRYdKyKgm17Vt_HOetPIU9ROi-XFFFy67fivkGEmhHXwfnmAuFp-oY8rSGePPz3AlK-jAAzLS155u1X-8_nW1JHrwEpiv34Li5GrD-oG_ZlsLNBg2jBlwW8rjascj3QyRx4wLzFlUXg3RS_iA7a24vzp9l1nwJ_d9Hdnr0XVuoRW7XXBioUN5_pku08paYAk8B6N0gpobODU5pRDj3m_b6k5WIllJLBZ6Y64VAmydfSHUevtT6Tsrq5Hs2ZC-QlTG7wmkRvRTzZCIQ_GwEIylpkcqdQsJ08UcZ-ZYklGu0jH8TMC6zEVLK9qGMfiMXqST9BG6JU5G8mqVgdD-7iFInN7ztZi5XOcYco_B3PIEcwR3bPlFTRSdwqcu5eQBvmNL3PrQVTFrqdNNgMBIUoHaOTo8fl-OIXG8VMMMBK81OmFao-l961hVzEA";
String TOKEN2 ="eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMTI3NTgzZTIxNjE1ODA4Nzk1NjFjZTBjZjJlOWU0YTk5NGU2ZTVlMjc4YWZhZGM1YzI0MWJiOGYxNzM0N2E5Y2I5YTMyNWFmNjQ3YmM3ZTgiLCJpYXQiOjE2OTIzODM0NDQuNjgxNDQ1LCJuYmYiOjE2OTIzODM0NDQuNjgxNDQ4LCJleHAiOjE3MjQwMDU4NDQuNjc1MjM2LCJzdWIiOiIxIiwic2NvcGVzIjpbImFkbWluIl19.RsqwiByZY6IRR72IAhnmsamiiccISGneyCtDqZwLx0_r5vtDi4e-i--AueBXSaLDJkS0pwBqPkJnF90LyRyCWKG4TH8APGcN4tDguZ2dmv6pT2jBLUnQNXYQENWl9nlFWAFCLl-ThAR6MPIOG4bZWoC7vc2_mCL6vFggRlzM0VkaxIMqovS2dJddVWdepnQHEUXqBCUEHYiEPceMZSo9F22o2g0bpeXRHzLAyt704Jv5KEyKUg3874muLqdseYa0WZle_PBRQCtsU4ytrvOBcmpp96QA-V_b4ZQoUuIxu2NY-xAZHNIppJrlNGMBmeDAegnfphiGuoNFWQKxQgypu7R9E_tGZ1HyBNWnlbqyRZXoGL-poHWFoNyCyWjqyEmfmrtYY0IWPOTUMyuzOpDgkBkT8SbrytooIj_OFrmKtUr5sxEM7rPgWFadwIkwFJ_gLxC4673kVyyljESYAPSRMabtQFrF6Tf_yowMa0okP9H28ontHXyyurC6-ReG8nMPu8O3mvjL7zxBOU7UsFtMslj5BmjUFgPkFddkFWhF2Q1XpJP5jhK3EcC4pnIhE-hFJebhhWmPSGQxZrL1J-AZynOlRq7dOR790aO6bMJFPA00W_UpdxtwmExJtYchazsOLJH-3V7YDitGfPMQAU6aEkQkEqUjg5EOhBDdmqtKBq4";
class dioHelper {
  static late Dio dio;
  static Map<String, dynamic> headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $TOKEN',
  };

  // Authorization
  static init() {
    dio = Dio(
        BaseOptions(
            baseUrl:baseUrl,
            receiveDataWhenStatusError: true,
            headers: headers,
            validateStatus: (status) {
              return true;
            }));
  }

  static Future<dynamic> getData({required String url,
    dynamic query, dynamic data }) async {
    late Response response;
    try {
      response = await dio.get(
        baseUrl + url,
        queryParameters: query,
      );
      // Logger().d('URL : '+
      //     baseUrl + url+ '\n'+
      //     'query : '+
      //     query.toString() + '\n'+
      //     'BODY : '+
      //     data.toString() + '\n'+
      //     'RESPONSE : '+
      //     response.toString());


     print( 'URL : '+
         baseUrl + url+ '\n'+
         'query : '+
         query.toString() + '\n'+
         'BODY : '+
         data.toString() + '\n'+
         'RESPONSE : '+
         response.toString());
    }
    on SocketException {
      //Logger().e('SocketException');
    } catch (e) {
     // Logger().e(e);
    }

    return response.data;
  }

  static Future<dynamic> postData({required String url,
    dynamic query,
    dynamic data}) async {
    print("ZZZZZZZZZZZZZZZZZZZZZZZ");
    print(TOKEN);
    print("ZZZZZZZZZZZZZZZZZZZZZZZ");
    late Response response;
    try {
      response = await dio.post(
        url,
        queryParameters: query,
        data: data,
      );
      print( 'URL : '+
          baseUrl + url+ '\n'+
          'query : '+
          query.toString() + '\n'+
          'BODY : '+
          data.toString() + '\n'+
          'RESPONSE : '+
          response.toString());
      // Logger().d('URL : '+
      //     baseUrl + url+ '\n'+
      //     'RESPONSE : '+
      //     response.toString());
    } on SocketException {
      // Logger().e('SocketException');
    } catch (e) {
     // Logger().e(e);
      print(e);
    }
   return response;
  }



  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? data,
  }) async {
    print(baseUrl+url);
    return await dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<dynamic> deleteData({
    required String url,
    dynamic query,
  }) async {
    late Response response;
    try {
      response = await dio.delete(
        baseUrl + url,
        queryParameters: query,
      );
      print('URL : ' +
          baseUrl +
          url +
          '\n' +
          'query : ' +
          query.toString() +
          '\n' +
          'RESPONSE : ' +
          response.toString());
    } on SocketException {
      print('SocketException');
    } catch (e) {
      print(e);
    }
    return response.data;
  }

  static Future<Response> postFormData({
    required String url,
    Map<String, dynamic>? query,
    formData,
  }) async {
    print(baseUrl+url);
    print(url);
    return await dio.post(url, data: formData);
  }
}