
import 'package:project/core/resources/export_file.dart';
import 'package:retrofit/retrofit.dart';
part 'app_api.g.dart';


@RestApi(baseUrl: kDebugMode?SecertData.baseUrlsDebug :SecertData.baseUrls)
abstract class AppServiceApiClient{

  factory AppServiceApiClient(Dio dio,{String baseUrl})=_AppServiceApiClient;







/*

 case upload file
  @POST('............upload url extension exclude baseUrl ..........') 
  @MultiPart()
  Future<ResponseType> functionName(
      // other paramter
      @Part() String paramterName,

      //in case file must not be null
      @Part() File imageOrFileName,
      [
      //in case if file not send or null to avoid null exception 
      @Part() File? imageOrFileName,
 
     ]

      );
*/


/*
  case normal requests without headers paramter like token
  @POST("............upload url extension exclude baseUrl ..........")
  Future<ResponseType> functionName(@Field("nameParamterInBackend") String paramterName,.......add any paramter );

*/


/*
  case normal requests with headers paramter like token
  @POST("............upload url extension exclude baseUrl ..........")
  Future<ResponseType> functionName(@Header("nameParamterInBackend") String nameParamter,@Field("nameParamterInBackend") String paramterName,.......add any paramter );

*/



/*
  case normal requests with headers paramter like token and and url changed paramter
  @POST("............upload url extension exclude baseUrl ..........url +{paramterValueChanged} any where you put in url with brackets and inside add paramterValueChanged")
  Future<ResponseType> functionName(@Path() int paramterValueChanged,@Header("nameParamterInBackend") String nameParamter,@Field("nameParamterInBackend") String paramterName,.......add any paramter );

*/

}