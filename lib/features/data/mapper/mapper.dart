import '../../../core/resources/export_file.dart';
import '../../domain/entity/logout.dart';
extension LogoutResponseAuthMapper on LogoutAuthResponse?
{
  Logout toDomain()
  {
    return Logout(this?.isLoggedOut.orBoolDefaultFalseValue()??AppConstants.defaultEmptyBoolFalse);
  }
}