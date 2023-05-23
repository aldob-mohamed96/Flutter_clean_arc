import '../../../../core/resources/export_file.dart';
abstract class AppRepository {


  Future<Either<Failure,bool>> logout();
 /*

 Future<Either<Failure, OutPut>> getDriverOrders(InputRequest input);
*/
}