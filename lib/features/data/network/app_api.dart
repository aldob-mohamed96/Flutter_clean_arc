
import 'package:project/core/resources/export_file.dart';
import 'package:retrofit/retrofit.dart';
part 'app_api.g.dart';


@RestApi(baseUrl: kDebugMode?SecertData.baseUrlsDebug :SecertData.baseUrls)
abstract class AppServiceApiClient{

  factory AppServiceApiClient(Dio dio,{String baseUrl})=_AppServiceApiClient;



}