// ignore_for_file: constant_identifier_names

import 'package:project/core/resources/export_file.dart';



abstract interface class DioFactory{
  Future<Dio> getDio();


}
final class DioFactoryImpl implements DioFactory{


  @override
  Future<Dio> getDio()async{



   
   Dio dio=Dio();
   
   Map<String,String>headers={
     AppConstants.contentType:AppConstants.applicationJson,
     AppConstants.accept:AppConstants.applicationJson,



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