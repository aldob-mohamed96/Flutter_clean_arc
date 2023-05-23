import 'package:project/core/resources/export_file.dart';
extension LogoutResponseAuthMapper on LogoutAuthResponse?
{
  bool toDomain()
  {
    return this?.isLoggedOut.orBoolDefaultFalseValue()??AppConstants.defaultEmptyBoolFalse;
  }
}