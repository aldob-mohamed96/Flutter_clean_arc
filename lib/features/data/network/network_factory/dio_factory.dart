// ignore_for_file: constant_identifier_names

import 'package:project/core/resources/export_file.dart';



abstract interface class DioFactory{
  Future<Dio> getDio();


}
class DioFactoryImpl implements DioFactory{

  final AppPreferences _appPreferences;
  DioFactoryImpl({required AppPreferences appPreferences}):
  _appPreferences=appPreferences; 
@override

  Future<Dio> getDio()async{

  final token= _appPreferences.getToken();
  
    
   
   Dio dio=Dio();
   
   Map<String,String>headers={
     AppConstants.contentType:AppConstants.applicationJson,
     AppConstants.accept:AppConstants.applicationJson,
   
     AppConstants.authorization:token.value,



   };

   dio.options=BaseOptions(
     baseUrl: kDebugMode?AppConstants.baseUrlsDebug:AppConstants.baseUrls,
     receiveTimeout:const Duration(milliseconds: AppConstants.receiveTimeout),
     sendTimeout: const Duration(milliseconds: AppConstants.sendTimeout),

     headers: headers,


   );

   //logs in debug mode only for security
    if(!kReleaseMode) {
    
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
      }

    return dio;
  }




}