import 'package:project/core/resources/export_file.dart';

class Authentication extends Equatable{

  final AppAuthenticationLevel  appAuthenticationLevel;

  const Authentication(this.appAuthenticationLevel);

  @override
  List<Object?> get props => [appAuthenticationLevel];

}